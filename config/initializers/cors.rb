Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://52.188.64.135:5000'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end