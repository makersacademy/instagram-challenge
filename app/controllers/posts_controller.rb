class PostsController < ApplicationController
  def new
    @user = User.find(session[:user_id])
  end

  def create
    Post.create(post_params)
    redirect_to "/users/#{session[:user_id]}"
  end

  private
  def post_params
    params.require(:post).permit(:description, :image, :user_id)
  end
end
