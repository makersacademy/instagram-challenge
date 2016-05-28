class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Woohoo! Here's your new post!"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "Uh oh! You need to select an image!"
      render "new"
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
    if @post.update(post_params)
      flash[:success] = "Woohoo! Here's your updated post!"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "Uh oh! You need to select an image!"
      render "new"
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
