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
    if @post.save
      redirect_to posts_path
    else
      redirect_to root_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:picture, :caption)
  end
end
