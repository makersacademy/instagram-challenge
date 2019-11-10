class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_param)
    redirect_to '/'
  end

  private
  def post_param
    new_params = params.require(:post).permit(:picture, :message)
    new_params.merge(user_id: current_user.id)
  end
end
