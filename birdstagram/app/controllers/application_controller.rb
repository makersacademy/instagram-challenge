class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :logged_in?
  helper_method :find_user
  helper_method :load_comments

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def find_user(user_id)
    User.find(user_id).username
  end

  def load_comments(post_id)
    @comments = Comment.where(post_id: post_id).pluck(:text, :user_id)
  end

end
