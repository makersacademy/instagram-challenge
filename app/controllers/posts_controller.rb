class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
  end

  def create
    Post.create(post_params)
    redirect_to '/posts'
  end

  private
  def post_params
    params.require(:post).permit(:description)
  end

end
