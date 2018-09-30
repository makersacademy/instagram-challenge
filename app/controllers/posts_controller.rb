class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_url
  end

  def index
    @posts = Post.all
    @users = User.all
  end

  private

  def post_params
    params.require(:post).permit(:message, :image)
  end
end
