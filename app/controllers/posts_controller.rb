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
      flash[:success] = "Woohoo! Here's your new post!"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "Uh oh! You need to select an image!"
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Woohoo! Here's your updated post!"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "Uh oh! You need to select an image!"
      render "edit"
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = "Your post was successfully deleted!"
      redirect_to posts_path
    else
      flash[:alert] = "Uh oh! Couldn't delete your post!"
      redirect_to post_path(@post)
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
