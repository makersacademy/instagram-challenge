class ApplicationController < ActionController::Base

  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?
  helper_method :usernameById

  def current_user
    User.find_by(id: session[:user_id])
  end

  def usernameById(id)
    user = User.find_by(id: id)
    user.username
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to root_path unless logged_in?
  end
end
