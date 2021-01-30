class PostsController < ApplicationController

  def index
    @post = Post.new
    @posts = Post.all
  end

  def create
    @user = current_user
    @post = @user.posts.create(post_params)
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:caption, :created_at, :image)
  end
end
