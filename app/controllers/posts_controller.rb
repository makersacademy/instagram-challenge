class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  before_filter :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def show
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:picture, :description)
  end
end
