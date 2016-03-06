class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:notice] = 'Your image was uploaded!'
      redirect_to @post
    else
      flash[:notice] = 'You need to upload an image to post!'
      render 'new'
    end
  end

  def post_params
    params.require(:post).permit(:caption,:image)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    flash[:notice] = 'Your post has been updated!'
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Your post has been deleted!'
    redirect_to posts_path
  end
end
