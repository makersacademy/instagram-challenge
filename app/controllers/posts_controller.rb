class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
  end

  def create
    @post = Post.create(user_params)
    redirect_to @post
  end

  private

  def user_params
    params.require(:post).permit(:comment, :avatar)
  end

end
