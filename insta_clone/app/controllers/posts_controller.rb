class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if user_owns_post?
      @post.update(post_params)
      redirect_to '/'
    else
      flash[:notice] = "You can only edit your own posts"
      redirect_to '/'
    end

  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to '/'
  end

  private

  def user_owns_post?
    @post.user == current_user
  end

  def post_params
    params.require(:post).permit(:title, :user)
  end

end
