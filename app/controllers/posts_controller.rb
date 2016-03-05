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
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.owned_by?(current_user)
      @post.update(post_params)
    else
      flash[:notice] = 'You don\'t own this picture'
    end
    redirect_to '/posts'
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.owned_by?(current_user)
      @post.destroy
      flash[:notice] = "Deleted successfully"
    else
      flash[:notice] = 'You don\'t own this picture'
    end
    redirect_to '/posts'
  end

  def post_params
    params.require(:post).permit(:description, :image).merge(user: current_user)
  end

end
