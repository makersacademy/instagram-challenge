class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    if current_user.admin?
      @post = Post.find(params[:id])
    else
      @post = current_user.posts.find(params[:id])
    end
    @post.destroy
    flash[:notice] = 'Post deleted successfully'
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:description, :image, :filter)
  end
end
