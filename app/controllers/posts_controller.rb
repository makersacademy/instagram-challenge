class PostsController < ApplicationController

  def new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:caption)
  end

end
