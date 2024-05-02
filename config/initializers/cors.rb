# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin Ajax requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  # allow do
    # origins 'http://localhost:3000', 'https://trackers-app-76d9dc18a2c1.herokuapp.com/'

  allow do
    origins 'https://trackers-app-76d9dc18a2c1.herokuapp.com/'
    resource '/api/*', headers: :any, methods: [:get, :post, :options, :put, :delete]
  end

  allow do
    origins 'http://localhost:3000'
    resource '*', headers: :any, methods: [:get, :post, :options, :put, :delete]
  end

    # resource "*",
    #   headers: :any,
    #   methods: [:get, :post, :put, :patch, :delete, :options, :head]
  # end
end
