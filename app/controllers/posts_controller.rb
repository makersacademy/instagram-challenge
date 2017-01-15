class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    user = current_user
    user.posts.create(post_params)
    redirect_to '/posts'
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    user = current_user
    if user.posts.include?(@post)
      @post.update(post_params)
      redirect_to post_path(@post)
    else
      flash[:notice] = 'This is not your post you cannot edit it'
      redirect_to post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post successfully deleted'
    redirect_to '/posts'
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
