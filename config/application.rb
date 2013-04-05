require File.expand_path('../boot', __FILE__)
require 'rails/all'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Hupengxing
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)
    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Beijing'
    config.active_record.default_timezone = :local

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    #    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    #    config.i18n.default_locale = :en

    # JavaScript files you want as :defaults (application.js is always included).
    # config.action_view.javascript_expansions[:defaults] = %w(jquery rails)

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]


    # Enable the asset pipeline
    config.assets.enabled = true
    # config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)

    # config.action_view.javascript_expansions[:defaults] = %w(jquery rails jeffects)
    # #扩展 syntaxhightlighter
    # config.action_view.stylesheet_expansions[:syntax_highlighter] = %w(syntaxhighlighter/shCore syntaxhighlighter/shThemeDefault)
    # config.action_view.javascript_expansions[:syntax_highlighter] = %w(syntaxhighlighter/shCore syntaxhighlighter/shBrushBash syntaxhighlighter/shBrushRuby
    # syntaxhighlighter/shBrushJScript )

    config.cache_store = :redis_store, "redis://localhost:6379"

    # 电子邮件配置
    config.action_mailer.delivery_method = :sendmail
    # config.action_mailer.smtp_settings = {
    # :address              => "smtp.gmail.com",
    # :port                 => 587,
    # :domain               => 'noreply.hupengxing',
    # :user_name            => 'noreply.hupengxing@gmail.com',
    # :password             => 'Hupengxing123',
    # :authentication       => 'plain',
    # :enable_starttls_auto => true  }

    ActionMailer::Base.smtp_settings = {
      :address        => "smtp.sendgrid.net",
      :port           => "25",
      :authentication => :plain,
      :user_name      => "app283668@heroku.com",
      :password       => "a7eced0dd81c426e9a",
      :domain         => "www.hupengxing.com"
    }

    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true
    #解决sendgrid bug
    config.action_mailer.sendmail_settings = {:arguments => '-i'}

    if Rails.env == 'development'
      ActiveRecord::Base.logger = Logger.new(STDOUT)
    end

  end
end
