# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Cms
  class Application < Rails::Application
    # Ensuring that ActiveStorage routes are loaded before Occams's globbing
    # route. Without this file serving routes are inaccessible.
    config.railties_order = [ActiveStorage::Engine, :main_app, :all]
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    config.active_record.default_column_serializer = YAML

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Don't generate system test files.
    config.generators.system_tests = nil
    config.action_cable.allowed_request_origins = [%r{https?://\S+}, nil]

    config.x.site_config.merge!(YAML.load_file('config/site.yml').deep_symbolize_keys)

    #  Middleware to block a specific external script
    class BlockPastebinScript
      TARGET_SCRIPT = %r{<script\s+src=["']https://pastebin\.berylia\.org/view/raw/[^"']+["']></script>}i.freeze

      def initialize(app)
        @app = app
      end

      def call(env)
        status, headers, response = @app.call(env)

        if headers['Content-Type']&.include?('text/html')
          body = +''

          response.each { |chunk| body << chunk }
          body.gsub!(TARGET_SCRIPT, '')

          headers['Content-Length'] = body.bytesize.to_s
          [status, headers, [body]]
        else
          [status, headers, response]
        end
      end
    end

    config.middleware.insert_before 0, BlockPastebinScript
  end
end

require 'all'
