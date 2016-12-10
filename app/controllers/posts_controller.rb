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
    @comments = @post.comments
  end

  def edit
    @post = Post.find(params[:id])
    if !@post.belongs_to_user?(current_user)
      flash[:notice] = 'Can only edit your own posts'
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to "/posts/#{@post.id}"
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.belongs_to_user?(current_user)
      @post.destroy
      flash[:notice] = 'Post deleted successfully'
    else
      flash[:notice] = 'Can only delete your own posts'
    end
    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :description, :image).merge(user: current_user)
    end


end
