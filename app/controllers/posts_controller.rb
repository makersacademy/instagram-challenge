class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:picture, :caption, :user)
  end
end
