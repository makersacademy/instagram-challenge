class PostsController < ApplicationController

  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.reverse
  end

  def edit
    post
  end

  def show
    @posts = Post.all.reverse
    render 'index'
  end

  def destroy
    post.destroy
    redirect_to root_url
  end

  def update
    post.update_attributes(post_params)
    redirect_to post
  end

  private

  def post
    @post ||= Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:message, :image)
  end
end
