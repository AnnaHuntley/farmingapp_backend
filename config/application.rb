require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FarmingApp
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

    # Allow requests from the React app running on localhost:3000
    
    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Origin' => '*',
      'Access-Control-Allow-Methods' => 'POST, PUT, PATCH, DELETE, GET, OPTIONS',
      'Access-Control-Allow-Headers' => 'Origin, X-Requested-With, Content-Type, Accept, Authorization',
      'Access-Control-Allow-Credentials' => 'true'
    }

    
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://52.188.64.135:5000/'
        resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options]
      end
    end
  end
end
