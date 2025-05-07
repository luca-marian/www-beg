# frozen_string_literal: true

module Config
  module AuthConfig
    Rails.application.configure do
      config.x.auth_cookie_key = :user_id
      config.x.auth_jwt_key = :user_principal
      config.x.ldap_host = ENV.fetch('LDAP_HOST', false)
      config.x.admin_users = YAML.load(
        File.read("#{Rails.root}/config/users.yml")
      )['users'].map { |credential| credential['username'] }
      config.x.admin_users << Rails.application.credentials.admin_username
    end
  end
end
