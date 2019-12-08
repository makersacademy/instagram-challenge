class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end
end
