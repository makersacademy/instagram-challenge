class PostsController < ApplicationController

  def index
    @posts = Post.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "Thanks for posting!"
      redirect_to posts_url
    else
      flash[:danger] = "Post unsuccessful!"
      render "new"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post
      @post.destroy
      flash[:success] = "Post deleted!"
      redirect_to posts_url
    else
      flash[:danger] = "Unable to delete post!"
      redirect_to posts_url
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
