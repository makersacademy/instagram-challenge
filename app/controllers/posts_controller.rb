class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]
  before_action :post_owner, only: [:edit, :destroy]


  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build_with_user(post_params, current_user)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted successfully'
    redirect_to '/posts'
  end

  private

  def post_owner
    @post = Post.find(params[:id])
    unless @post.user_id == current_user.id
      flash[:notice] = 'You did not create this comment'
      redirect_to posts_path
    end
  end

  def post_params
    params.require(:post).permit(:title, :description, :image)
  end

end
