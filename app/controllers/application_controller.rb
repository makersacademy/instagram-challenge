class ApplicationController < ActionController::Base
  helper_method :current_user

  def new
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
