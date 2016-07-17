class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]

  def index
    @posts = Post.all
  end

  def new

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:caption, :pic)
  end

end
