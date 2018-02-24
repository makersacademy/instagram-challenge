class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

 protected

 def configure_permitted_parameters
 # Permit the `subscribe_newsletter` parameter along with the other
 # sign up parameters.
 devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
 end

end
