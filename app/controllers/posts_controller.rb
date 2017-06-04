class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
    @post = Post.new
    @comment = Comment.new
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image, :user_id, :filter)
  end
end
