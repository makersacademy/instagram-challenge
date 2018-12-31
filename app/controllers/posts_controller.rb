class PostsController < ApplicationController
before_action :authenticate_user!



  def index
    @posts = Post.all

  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(post_id: params[:id])
  end

  def new
  end

  def create
    @post = Post.new(post_params)

    @post.save
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:image, :description, :created_by)
  end

end
