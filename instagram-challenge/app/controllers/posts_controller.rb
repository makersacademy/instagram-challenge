class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(permitted_posts_params)
    redirect_to posts_path
  end

  private

  def permitted_posts_params
    params.require(:post).permit(:description, :image)
  end

end
