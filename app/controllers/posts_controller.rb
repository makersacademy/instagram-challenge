class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def post_params
    params.require(:post).permit(:caption)
  end

  def create
    Post.create(post_params)
    redirect_to '/posts'
  end
end
