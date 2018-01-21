class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Your image has been succesfully posted!"
      redirect_to @post
    else
      flash[:alert] = "You cannot post without uploading an image."
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
