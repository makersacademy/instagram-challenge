class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all
    @users = User.all
    p @users.find(3).name
  end

  def show
    @post = Post.find(params[:id])
    @user = User.all
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
  @post = Post.find(params[:id])
  @post.destroy

  redirect_to posts_path
end

  private

  def post_params
    params.require(:post).permit(:text, :image, :user_id)
  end
end
