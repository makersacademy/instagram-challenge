class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to '/posts'
  end

  def show
    @post = Post.find(params[:id])
  end

  def like
    @post = Post.find(params[:id])
    @post.likes += 1
    @post.save
    redirect_to '/posts'
  end

  def post_params
    params.require(:post).permit(:title, :image, :tag)
  end

end
