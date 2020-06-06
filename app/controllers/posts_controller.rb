class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
  end

  def show

  end

  def show

  end

  private

  def post_params
    params.require(:post).permit(:image, :image_cache)
  end
end