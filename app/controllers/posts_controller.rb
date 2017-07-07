class PostsController < ApplicationController
  before_action :require_login

  def new
    @post = Post.new
  end

  def index
    @posts = Post.order(created_at: :desc)
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_url
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :photo)
  end
end
