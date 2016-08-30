# Post controller
class PostsController < ApplicationController
  def index
    @posts = Post.order('created_at')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = 'The post was added!'
      redirect_to '/posts'
    else
      flash[:alert] = 'Stop! You need an image to post!'
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'The post was destroyed.'
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:image, :title, :comment)
  end
end
