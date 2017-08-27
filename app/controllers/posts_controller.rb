class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.reverse_order
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    current_user.posts << post
    current_user.save
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end
end
