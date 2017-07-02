class PostsController < ApplicationController
  before_action :require_login, only: [:create, :new]
  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  private

    def post_params
      params.require(:post).permit(:photo,:caption)
    end
end
