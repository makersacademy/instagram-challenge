class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(paras)
    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def paras
    params.require(:post).permit(:caption, :image)
  end
end
