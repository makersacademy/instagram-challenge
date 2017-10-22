class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @restaurant = Post.new
  end

  def create
    @post = Post.new(post_params)

    @post.save
    redirect_to @post
  end

private

def post_params
  params.require(:post).permit(:title, :description, :image)
end
end
