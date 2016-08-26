class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to "/posts"
  end

  private

  #only permits caption params to be accepted by controller
  def post_params
    params.require(:post).permit(:caption)
  end

end
