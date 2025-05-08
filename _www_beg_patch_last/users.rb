# frozen_string_literal: true

class BasicAuthenticator
  MASTER_USERNAME = Rails.application.credentials.admin_username.to_sym
  # MASTER_PASSWORD = Rails.application.credentials.admin_password
  MASTER_PASSWORD = Rails.application.credentials.admin_password

  def self.check(username, password)
    build_user_config

    authenticate_local(username, password) || authenticate_ldap(username, password)
  end

  def self.authenticate_local(username, password)
    return unless @@user_config[username.to_sym]

    BCrypt::Password.new(@@user_config[username.to_sym]) == password
  end

  def self.authenticate_ldap(username, password)
    ldap = Net::LDAP.new(host: ::Rails.application.config.x.ldap_host, port: 389)
    if ldap.bind(method: :simple, username:, password:)
      true
    else
      false
    end
  rescue StandardError
    false
  end

  def self.build_user_config
    return @@user_config if defined? @@user_config

    @@user_config = {}
    # @@user_config[MASTER_USERNAME] = MASTER_PASSWORD
    YAML.load(File.read("#{Rails.root}/config/users.yml"))['users'].each do |credential|
      @@user_config[credential['username'].to_sym] = BCrypt::Password.create([credential['password']].pack('H*'))
    end
    @@user_config
  end
end
