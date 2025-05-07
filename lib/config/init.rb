# frozen_string_literal: true

module Config
  class Init < Rails::Railtie
    initializer 'config_init.configure_rails_initialization' do
      module ::YAML
        class << self
          alias load unsafe_load
        end
      end
    end
  end
end
