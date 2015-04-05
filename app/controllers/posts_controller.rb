class PostsController < ApplicationController

  before_action :authenticate_user!


  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(post_params, current_user)
      redirect_to '/posts'
  end

  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy
    flash[:notice] = "Post deleted successfully"
    redirect_to '/posts'
  end

  def post_params
    params.require(:post).permit(:name, :image)
  end

end
