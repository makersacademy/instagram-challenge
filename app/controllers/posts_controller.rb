class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Your image has been succesfully posted!"
      redirect_to @post
    else
      flash[:alert] = "You cannot post without uploading an image."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post updated"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error: Please upload an image file."
      render "edit"
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Your post has been succesfully deleted"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
