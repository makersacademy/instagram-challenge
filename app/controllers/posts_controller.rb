class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_url(@post)
    else
      redirect_to new_post_path
    end
  end

  def post_params
    params.require(:post).permit(:description, :image)
  end

end
