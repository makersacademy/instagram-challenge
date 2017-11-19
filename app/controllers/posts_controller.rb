class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'Your post has been created.'
      redirect_to @post
    else
      flash[:alert] = 'Something is wrong with your form!'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post updated.'
      redirect_to posts_path
    else
      flash[:alert] = 'Something is wrong with your form!'
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'Post deleted.'
    redirect_to root_path
  end

  private

  def post_params
    params.permit(:text, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
