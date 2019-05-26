class PostsController < ApplicationController

  before_action :authenticate_user!

  def index
    @posts = Post.all.reverse
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))
    if @post.save
      flash[:success] = "Your post has been created successfully"
      redirect_to posts_path
    else
      flash.now[:alert] = "Your post wasn't uploaded. Please try again"
      render :new
      # if using render method change to flash.now
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

end
