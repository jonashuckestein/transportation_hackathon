require File.expand_path('../boot', __FILE__)

require 'rails/all'

Class.new Rails::Railtie do
  console do |app|
    Bundler.require(:console)
  end
end

groups = {
  heroku: %w(staging production),
}

Bundler.require(:default, :rails, :database, :web_server,
  :jobs, :console, :assets, :analytics, Rails.env, *Rails.groups(groups))

module Transportation
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
    #I18n.enforce_available_locales = true
    #I18n.fallbacks = [:en]

    config.cache_store = :redis_store, ENV["REDIS_URL"]+"/transportation_cache"

    ### EMAILS VIA MANDRILL ###
    config.action_mailer.smtp_settings = {
      address: "smtp.mandrillapp.com",
      port: 587,
      enable_starttls_auto: true,
      user_name: ENV["MANDRILL_USERNAME"],
      password: ENV["MANDRILL_API_KEY"],
      authentication: "login",
      domain: "hipdial.com",
    }
    config.action_mailer.default_url_options = {
      host: "hipdial.com"
    }

    config.autoload_paths += %W["#{config.root}/app/validators/"]
    config.autoload_paths += %W["#{config.root}/spec/mailers/preview/"]

    config.analytics_enabled = true

    # some numbers (such as toll free numbers) can't send sms. in that
    # case the backup numbers are used
    config.twilio_backup_sms_senders = {
      "1" => "+14151231312"
    }

    routes.default_url_options = {
      protocol: "http",
      #host: "localhost",
      #port: 3000
      port: 80,
      host: "transportation_hackathon.herokuapp.com",
    }
  end
end
