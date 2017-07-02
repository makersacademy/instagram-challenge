class PostsController < ApplicationController
  before_action :require_login

  def new
  end

  def index
    @posts = Post.order(created_at: :desc)
  end

  def create
    post = current_user.posts.create(post_params)
    post.save
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:title)
  end
end
