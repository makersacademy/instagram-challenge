class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all
    @comment = @post.comments.new
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    if post.save
      flash[:notice] = 'Your post has been saved'
      redirect_to root_path
    else
      flash[:alert] = 'Your post has not been saved'
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    if Post.find(params[:id]).destroy
      flash[:notice] = 'Your post has been deleted'
      redirect_to root_path
    else
      flash[:alert] = 'Your post was not deleted'
      redirect_to post_path(params[:id])
    end
  end

  private
  def post_params
    params.require(:post).permit(:image, :caption)
  end
end