class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]


  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Post has been created"
      redirect_to @post
    else
      flash[:alert] = "You must provide a picture with your upload"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update

    if @post.update(post_params)
      flash[:success] = "Post updated"
      redirect_to posts_path
    else
      flash.now[:alert] = "Update failed. Please check the form."
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end