require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Turtle
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.time_zone = 'Eastern Time (US & Canada)'
    config.active_record.default_timezone = :local

    # asset precompile setting for Heroku
    config.assets.initialize_on_precompile = false

    # get sass to compile my files in vendor
    config.sass.load_paths << File.expand_path('../../vendor/assets/stylesheets/')

    # rspec generators
    config.generators do |g|
        g.test_framework :rspec,
            fixtures: true,
            view_specs: false,
            helper_specs: false,
            controller_specs: false,
            request_specs: true
        g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end
  end
end
