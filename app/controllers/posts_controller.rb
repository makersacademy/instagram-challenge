class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = 'You made a post, yay!'
      redirect_to @post
    else
      flash[:alert] = 'Nope. Nope. You must provide an image!'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post\'s been updated, yo.'
      redirect_to(post_path(@post))
    else
      flash[:alert] = 'Only a pic file works here, bro.'
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:alert] = 'Post\'s been deleted, phew!'
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
