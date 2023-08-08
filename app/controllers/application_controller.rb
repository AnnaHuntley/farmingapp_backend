class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  
    before_action :set_cors_headers, if: -> { request.method == 'OPTIONS' }
  
    private
  
    def set_cors_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, PATCH, DELETE, GET, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
      headers['Access-Control-Allow-Credentials'] = 'true'
    end
  end
  