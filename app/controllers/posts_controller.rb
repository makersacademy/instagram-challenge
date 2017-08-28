class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    current_user.posts << @post
    current_user.save
    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

end
