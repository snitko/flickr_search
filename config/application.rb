require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FlickrSearch
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
    
    config.generators do |g|
      g.template_engine     :haml
      g.test_framework      :rspec, :fixtures => true, :views => false
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end

    config.cache_store = :redis_store, 'redis://localhost:6379/0/cache', { expires_in: 90.minutes }
    
    require 'flickraw'

    # As this is just a test app, I'm putting API keys here.
    # Normally I would put keys into a .yml file and add it to .gitignore.
    FlickRaw.api_key="2d64ecec5ec9ab95d86e3d49993e1a64"
    FlickRaw.shared_secret="519eb1082c328e70"

  end
end
