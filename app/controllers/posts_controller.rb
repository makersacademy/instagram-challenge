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
    redirect_to '/posts'
  end

  def show
    @post = Post.find(params[:id])
    p @post
    @comments = Comment.where(:post_id=>params[:id])
    p @comments
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to '/posts'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted successfully'
    redirect_to '/posts'
  end

  def post_params
    params.require(:post).permit(:title, :desc)
  end

end
