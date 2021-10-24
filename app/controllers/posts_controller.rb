class PostsController < ApplicationController

  def new
    redirect_to root_path if !session[:user_id] 
    @post = Post.new
  end

  def create
    redirect_to root_path if !session[:user_id]
    @user = User.find(session[:user_id])
    @post = @user.posts.create(post_params)
    redirect_to posts_url
  end

  def destroy
    @post = Post.find(params[:id])
    @comment = @post.comments.where(post_id: @post.id) 
    @comment.each do |comment|
      comment.destroy
    end
    @post.destroy
    redirect_to posts_path, notice: 'Your post was deleted successfully'
  end

  def index
    redirect_to root_path if !session[:user_id]
    @posts = Post.all
  end

  def show
    redirect_to root_path if !session[:user_id]
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:message, :image, :user_id)
  end

end
