class PostsController < ApplicationController

  load_and_authorize_resource

  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

end
