class HomeController < ApplicationController
  def index
    logged_in?
    @posts = Post.all
    @post = Post.new
  end

  private

  def logged_in?
    redirect_to new_user_session_path unless current_user
  end
end
