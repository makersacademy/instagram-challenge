class PostsController < ApplicationController


  before_action :authenticate_user!

  def index
    @posts = Post.all
    @users = User.all
  end

  def new
    @post = Post.new
  end

  def create
    @current_user = current_user
    @post = @current_user.posts.new(post_params)
    if @post.save
      redirect_to '/posts'
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to '/posts'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted successfully'
    redirect_to '/posts'
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
