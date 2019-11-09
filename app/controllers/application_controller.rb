class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!


  protected
 def after_sign_in_path_for(_resource)
   '/'
 end

 def after_sign_out_path_for(_resource)
   "/users/sign_in"
 end
end
