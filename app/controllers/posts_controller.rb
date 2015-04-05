class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @user = current_user
    @posts = Post.all
    @like = Like.new
    @comment = Comment.new
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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted successfully'
    redirect_to '/posts'
  end

end