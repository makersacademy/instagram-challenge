class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def require_user_logged_in!
    unless Current.user
      redirect_to root_url
      flash[:notice] = "Please log in first."
    end
  end

  def prevent_logged_in_user!
    if Current.user
      redirect_to posts_url
    end
  end
end
