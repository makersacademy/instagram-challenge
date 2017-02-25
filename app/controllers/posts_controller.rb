class PostsController < ApplicationController

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @user.posts.create(post_params)
    redirect_to '/'
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

end
