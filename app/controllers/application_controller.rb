class ApplicationController < ActionController::Base
  helper_method :current_user, :there_are_posts?, :user_already_liked_post?

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def there_are_posts?
    @posts.length > 0
  end

  def user_already_liked_post?(user_id, post_id)
    Like.where(user_id: user_id, post_id:
    user_id).exists?
  end

end
