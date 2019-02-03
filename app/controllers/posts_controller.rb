class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(paras)
    if @post.save
      create_success
    else
      create_failure
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def paras
    params.require(:post).permit(:caption, :image)
  end
  
  def create_success
    flash[:success] = "Your post has been successfully created"
    redirect_to @post
  end

  def create_failure
    flash[:alert] = "Please add an Image"
    render :new
  end
end
