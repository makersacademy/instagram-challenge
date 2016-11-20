class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(image_params)
    redirect_to posts_path
  end

  def index
    @posts = Post.all
  end

private

def image_params
  params.require(:post).permit(:image, :tag)
end

end
