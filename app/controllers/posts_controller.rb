class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    @posts = Post.all.order('created_at DESC')
  end

  def create
    @user = current_user
    @post = @user.posts.create(post_params)

    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:caption, :created_at, :image)
  end
end
