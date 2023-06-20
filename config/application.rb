require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Initapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.host_authorization = { exclude: ->(request) { request.path =~ /health/ } }

    if ENV["RAILS_LOG_TO_STDOUT"].present?
      logger           = ActiveSupport::Logger.new(STDOUT)
      logger.formatter = config.log_formatter
      config.logger    = ActiveSupport::TaggedLogging.new(logger)
    end

    config.session_store :redis_store,
      servers: ["#{ENV['REDIS_URL']}/session"],
      expire_after: 90.minutes,
      key: "_#{Rails.application.class.module_parent_name.downcase}_session",
      threadsafe: true,
      secure: Rails.env.production? || Rails.env.staging?
  end
end
