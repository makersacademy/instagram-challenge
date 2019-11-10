class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # 
  # def auth_user
  #     redirect_to '/' unless user_signed_in?
  # end
end
