class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :owned_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      flash[:success] = "Your post has been created."
      redirect_to posts_path
    else
      flash[:alert] = "Please ensure an image is posted"
      render :new
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
      flash[:success] = "Post updated."
      redirect_to(post_path(@post))
    else
      flash[:alert] = "Please ensure an image is posted"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
    flash[:alert] = "Post deleted"
  end


  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def owned_post
    @post = Post.find(params[:id])
    unless @post.user.id == current_user.id
      flash[:alert] = "Unable to edit other users posts"
      redirect_to root_path
    end
  end

end
