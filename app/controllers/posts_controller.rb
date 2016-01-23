class PostsController < ApplicationController

  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to '/posts'
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption)
  end
end
