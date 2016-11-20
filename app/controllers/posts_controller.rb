class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(image_params)
    redirect_to 'posts_path'
end

private

def image_params
  params.require(:post).permit(:image, :caption)
end

end
