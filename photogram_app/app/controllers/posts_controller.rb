class PostsController < ApplicationController
  def index
    @posts = Post.all
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
      redirect_to @post
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == session[:user_id]
    @post.destroy
    redirect_to posts_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:text,:user_id)
  end
end
