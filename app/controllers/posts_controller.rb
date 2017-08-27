class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.reverse
    @comment = Comment.new
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  private
  def post_params
    params.require(:post).permit(:caption, :picture)
  end
end
