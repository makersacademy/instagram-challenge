class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      if @post.title.length < 3
        flash[:alert] = 'Error: Title must be minimum of 3 characters'
      else
        flash[:alert] = 'Error: Image required'
      end
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @post.update(post_params)
    flash[:notice] = "Post updated!"
    redirect_to post_path(@post)
  end

  def destroy
    @post.destroy
    flash[:notice] = 'Post deleted!'
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :caption, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
