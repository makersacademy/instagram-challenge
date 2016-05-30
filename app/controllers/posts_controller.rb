class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :can_edit, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Your post has been published"
      redirect_to posts_path
    else
      flash.now[:alert] = "Post failed. Check your submission priviledge"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update

    if @post.update(post_params)
      flash[:success] = "Your post has been updated."
      redirect_to(post_path(@post))
    else
      flash.now[:alert] = "Update failed."
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def can_edit
    unless current_user == @post.user
      flash[:alert] = "Cannot edit other user posts! Naughty user!"
      redirect_to root_path
    end
  end

end
