class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Post created"
      redirect_to @post
    else
      flash[:alert] = "You must select a picture to post"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to(post_path(@post))
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:description, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
