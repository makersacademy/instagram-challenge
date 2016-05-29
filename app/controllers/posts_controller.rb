class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success]='Post sucessfully posted'
      redirect_to @post
    else
      flash[:alert] = "You must attach an image to a post"
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
      flash[:success]='Post successfully updated'
      redirect_to root_path
    else
      flash[:alert] = "Try again"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success]="Successfully deleted"
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:image, :caption)
  end
end
