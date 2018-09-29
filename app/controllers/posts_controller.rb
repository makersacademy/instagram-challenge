class PostsController < ApplicationController
  
  def index
    @posts = Post.order( created_at: :desc )
  end

  def new
    @posts = Post.new
  end

  def create
    @post = Post.create(image: post_params[:image], description: post_params[:description], user: current_user)
    redirect_to posts_url
  end

  def user 
    @user = User.find(params[:user_id])
    @posts = Post.where(user: @user).order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:image, :description)
  end

end
