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

  def show
    @post = Post.find(params[:id])
  end

  private

  def restaurant_params
    params.require(:post).permit(:description, :image)
  end

end
