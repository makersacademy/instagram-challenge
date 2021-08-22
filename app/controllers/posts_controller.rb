class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
  end
  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end
  def post_params
    params.require(:post).permit(:user, :content, :image)
  end
end