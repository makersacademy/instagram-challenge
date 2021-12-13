class PostsController < ApplicationController
  before_action :require_login

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :user, :image)
  end
end
