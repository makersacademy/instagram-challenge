class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
      flash.now[:alert] = "Your new post couldn't be created!  Please check the form."
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post updated."
      redirect_to posts_path
    else
      flash.now[:alert] = "Update failed.  What did you do wrong?"
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post has gone"
    redirect_to posts_path
  end

private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:image,:caption)
  end
end
