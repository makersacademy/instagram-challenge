class ApplicationController < ActionController::Base
  include Response
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # add username to user sign up method by overriding built in devise method
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

end
