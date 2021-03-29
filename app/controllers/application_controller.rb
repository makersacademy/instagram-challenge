class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :username, :first_name, :last_name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :username, :first_name, :last_name])
  end
  
  protect_from_forgery with: :exception
end