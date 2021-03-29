class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    flash.notice = 'No page found at that address'
    redirect_to root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:username, :email, :first_name, :last_name, :password)
    end

    devise_parameter_sanitizer.permit(:update_account) do |user_params|
      user_params.permit(:username, :email, :first_name, :last_name, :password)
    end
  end
end
