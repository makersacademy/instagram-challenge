class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      flash[:alert] = 'Error: Image required'
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
    post = Post.find(params[:id])
    post.update(post_params)
    flash[:notice] = "Post updated!"
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = 'Post deleted!'
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :caption, :image)
  end

end
