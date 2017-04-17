class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:user_name,
               :email,
               :password,
               :password_confirmation,
               :remember_me)
    end
    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit(:login,
               :user_name,
               :email,
               :password,
               :remember_me)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:user_name,
               :email,
               :password,
               :password_confirmation,
               :current_password)
    end
  end
  protect_from_forgery with: :exception
end
