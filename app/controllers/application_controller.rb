class ApplicationController < ActionController::Base
  helper_method :current_user, :there_are_posts?

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def there_are_posts?
    @posts.length > 0
  end

end
