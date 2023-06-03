require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Vitalbooking
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    # config.active_job.queue_adapter = :delayed_job
    # Configuration for the application, engines, and railties goes here.
    #
    # config.assets.precompile += ['application-print.css']
    # config.action_controller.default_protect_from_forgery = true
      config.action_controller.default_protect_from_forgery = true

    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
