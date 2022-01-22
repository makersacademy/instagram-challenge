class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id

    if post.save
      flash[:success] = "Image posted!"
      redirect_to posts_path
    else
      flash.now[:danger] = "Something went wrong."
      render :new 
    end
  end

  def show
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:caption, :photo)
  end
  
end
