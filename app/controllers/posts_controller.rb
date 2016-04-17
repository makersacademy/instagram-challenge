class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(restaurant_params)
    redirect_to '/posts'
  end

  private

  def restaurant_params
    params.require(:post).permit(:description)
  end

end
