# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :there_are_posts?, :user_already_likes_post?, :find_like

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def there_are_posts?
    @posts.length > 0
  end

  def user_already_likes_post?(post_id)
    Like.where(user_id: current_user.id, post_id: post_id).exists?
  end

  def find_like(post_id)
    Like.find_by(user_id: current_user.id, post_id: post_id)
  end
end
