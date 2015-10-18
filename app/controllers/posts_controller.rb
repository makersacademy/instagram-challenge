class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @posts = Post.new
  end

  def create
    @posts = Post.create(post_params)
    redirect_to '/posts'
  end

  def post_params
    params.require(:post).permit(:description)
  end
end
