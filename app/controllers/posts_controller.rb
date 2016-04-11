class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(post_id: @post.id)
  end

  def new
    @user = User.find(current_user.id)
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @user = User.find(current_user.id)
    @post = @user.posts.create(post_params)
    if @post.save
      redirect_to posts_path 
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id
      @post.update(post_params)
      redirect_to posts_path 
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id
      @post.destroy
      flash[:notice] = 'Your post was deleted successfully'
      redirect_to posts_path
    else
      render "index"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :image)
  end
end
