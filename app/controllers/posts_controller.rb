class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    Post.create(post_params)
    redirect_to posts_url
  end

  private

  def post_params
    params.permit(:caption)
  end
end
