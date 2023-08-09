module FarmingApp
  class Application < Rails::Application
    config.load_defaults 7.0



    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*' 
        resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options]
      end
    end
  end
end
