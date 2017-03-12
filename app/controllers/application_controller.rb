class ApplicationController < ActionController::Base
  # Dotenv.load
  protect_from_forgery with: :exception
end
