# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

Rails.application.configure do
  config.enable_reloading = false
  config.cache_store = :redis_cache_store, { url: ENV.fetch('REDIS_URL', 'redis://redis:6379/0') }
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  # config.assets_host = 'code.berylia.org'
  config.public_file_server.enabled = true
  config.assets.compile = false
  config.active_storage.service = :local
  config.force_ssl = true
  config.logger = ActiveSupport::Logger.new($stdout)
                                       .tap  { |logger| logger.formatter = ::Logger::Formatter.new }
                                       .then { |logger| ActiveSupport::TaggedLogging.new(logger) }
  config.log_tags = [:request_id]
  config.log_level = ENV.fetch('RAILS_LOG_LEVEL', 'info')
  config.action_mailer.perform_caching = false
  config.i18n.fallbacks = true
  config.active_support.report_deprecations = false
  config.active_record.dump_schema_after_migration = false
  config.global_verifier = ActiveSupport::MessageVerifier.new(
    Rails.application.credentials.secret_key_base
  )
  ActionCable.server.config.logger = Logger.new(nil)
end
