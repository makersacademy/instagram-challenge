class PostsController < ApplicationController
before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def create
    @post = Post.new(post_params)

    @post.save
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:url, :description)
  end
end
