class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  def index
    @posts = Post.all
    @like = Like.new
    @comment = Comment.new
    @user = current_user
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @user.posts.create(post_params)
    redirect_to '/posts'
  end

  def post_params
    params.require(:post).permit(:description, :image)
  end

  def update
    @post = Post.find(params[:id])
    @post.add_like
    flash[:notice] = 'Liked!'
    redirect_to '/posts'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted successfully'
    redirect_to '/posts'
  end
end