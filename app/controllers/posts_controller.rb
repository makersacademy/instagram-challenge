class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to posts_path
  end

  private

  def post_params
    pps = params.require(:post).permit(:description, :image, :user_id)
    pps[:user_id] = current_user.id
    pps
  end
end
