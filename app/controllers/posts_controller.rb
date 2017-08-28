class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.reverse
    @like = Like.new
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    user = User.find(current_user.id)
    user.posts.create(post_params)
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :picture)
  end
end
