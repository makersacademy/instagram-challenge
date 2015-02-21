class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save ? (redirect_to '/posts') : (render 'new')
  end

  def post_params
    params.require(:post).permit(:title, :image)
  end
end
