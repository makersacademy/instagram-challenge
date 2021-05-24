class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts =  Post.all
  end

  def create
    post_params = params.require(:post).permit(:body, :image)
    @post = Post.create(post_params)
    redirect_to "/"
  end
end
