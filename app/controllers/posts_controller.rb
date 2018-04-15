class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    authenticate_user!
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
      redirect_to post_path(@post)

  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:description, :image)
  end
end
