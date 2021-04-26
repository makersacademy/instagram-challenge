class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @user = User.find_by_id(session[:user_id])
    @posts = Post.order('created_at': :desc)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id, :image)
  end
end