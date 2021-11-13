class PostsController < ApplicationController


  def new
    @post = Post.new
  end

  def show
  end


  def create
    @post = Post.new(post_params)
  end

  # perhaps new is get and create is post?

  private
  def post_params
    params.require(:post).permit(:image, :image_cache)
  end

end
