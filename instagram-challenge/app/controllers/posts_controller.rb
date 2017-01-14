class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(permitted_params)
    redirect_to posts_path
  end

  private

  def permitted_params
    params.require(:post).permit(:description)
  end

end
