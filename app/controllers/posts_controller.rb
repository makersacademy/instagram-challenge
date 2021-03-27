class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
  end

  def create
    Post.create(post_params)
    redirect_to posts_url
  end

  private

  def post_params
    params.permit(:caption, :image)
  end
end
