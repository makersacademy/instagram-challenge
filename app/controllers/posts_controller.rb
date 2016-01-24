class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to posts_path
  end

  def destroy
    post = Post.find(params[:id])
    if post.created_by?(current_user)
      post.destroy
      flash[:success] = 'Post deleted successfully'
    else
      flash[:error] = 'Only the owner can delete a post'
    end
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:image, :description).merge(user: current_user)
  end
end
