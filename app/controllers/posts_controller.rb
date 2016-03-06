class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.owned_by?(current_user)
      @post.update(post_params)
    else
      flash[:notice] = 'Sorry - you can only edit your own posts'
    end
      redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.owned_by?(current_user)
      @post.destroy
      flash[:notice] = 'Post deleted successfully'
    else
      flash[:notice] = 'Sorry - you can only delete your own posts'
    end
    redirect_to '/posts'
  end

  def post_params
    params.require(:post).permit(:description, :image).merge(user: current_user)
  end

end
