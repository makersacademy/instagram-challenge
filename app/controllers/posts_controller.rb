class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to "/"
    else
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Image successfully deleted"
    redirect_to "/posts"
  end

  private
  #only permits caption params to be accepted by controller
  def post_params
    params.require(:post).permit(:caption, :image)
  end

end
