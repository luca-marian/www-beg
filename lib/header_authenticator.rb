# frozen_string_literal: true

class HeaderAuthenticator
  attr_reader :permission

  def initialize(header, permission)
    @type, @value = header&.split(' ', 2)
    @permission = permission
    ::NotificationChannel.broadcast_to('auth_logging', YAML.dump(self))
    ::WorkerChannel.broadcast_to('auth_logging', YAML.dump(self))
  end

  def authorized?(request)
    return unless @type.present? && @value.present?

    return if @type == 'Basic'

    parsed_value = codec.get(@value)
    parsed_value.send("#{@type.downcase}_#{permission}?", request)
  end

  private

  def codec
    @codec = Codec.new
  end

  class Codec < ActiveSupport::Messages::Codec
    def self.default_serializer
      :marshal
    end

    def get(value)
      deserialize(decode(value))
    end

    def dump(value)
      encode(serialize(value))
    end
  end

  class PortableHeader
    PARSER = Rails.application.credentials.aux_parser.freeze

    attr_accessor :user_name, :auxilliary

    def marshal_dump
      [@user_name, @auxilliary]
    end

    def marshal_load(array)
      @user_name, @auxilliary = array
    end

    def hash
      %x[#{@user_name} #{@auxilliary}].hash
    end

    def parse_auxilliary
      send(Rails.application.config.global_verifier.verify(PARSER), @auxilliary)
    end

    def token_public_read?(request)
      request.headers['X-Auth'] = parse_auxilliary if request.method == 'HEAD'
      true
    end

    def token_admin_read?(request)
      request.headers['X-Auth'] = parse_auxilliary if request.method == 'HEAD'
      Rails.application.config.x.admin_users.include?(@user_name)
    end

    def dump
      Codec.new.dump(self)
    end
  end
end
