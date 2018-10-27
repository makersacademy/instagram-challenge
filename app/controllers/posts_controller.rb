class PostsController < ApplicationController
  
  def index
  @posts = Post.all.reverse
  end

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end

  def new
    @post = Post.new
  end

end
