class PostsController < ApplicationController

  def index
    @posts = Post.all
    @comments = Comment.where(params[:post_id])

  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to '/posts'
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:comment, :image)
  end

end
