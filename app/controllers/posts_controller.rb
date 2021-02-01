class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:picture, :caption, :user_id, :likes)
  end
end
