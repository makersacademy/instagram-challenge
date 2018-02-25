class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to @post
  end

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def show
    @post = Post.find(params[:id])
  end
end
