class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if user_owns_post?
      @post.update(post_params)
    else
      flash[:notice] = "You can only edit your own posts"
    end
    redirect_to '/'
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to '/'
  end

  def destroy
    @post = Post.find(params[:id])
    if user_owns_post?
      @post.destroy
      flash[:notice] = "Post deleted"
    else
      flash[:notice] = "You can only delete your own posts"
    end
    redirect_to '/'
  end

  private

  def user_owns_post?
    @post.user == current_user
  end

  def post_params
    params.require(:post).permit(:title, :user, :image)
  end

end
