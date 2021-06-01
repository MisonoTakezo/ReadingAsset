# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ReadingAsset
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    # i18n
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
    config.available_locales = :ja
    config.i18n.default_locale = :ja

    # Template engine
    config.generators.template_engine = :slim
    # TZ
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
  end
end
