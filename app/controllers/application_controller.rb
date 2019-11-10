class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?


  protected
 def after_sign_in_path_for(_resource)
   '/'
 end

 def after_sign_out_path_for(_resource)
   "/users/sign_in"
 end

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:forename, :surname])
   #in keys list all the additional user input params you want to accept. 
 end

end
