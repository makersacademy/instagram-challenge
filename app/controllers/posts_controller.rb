class PostsController < ApplicationController

  before_action :authenticate_user! # need to be logged in to see

  def index
    @posts = Post.all.reverse
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))
    # merge returns a new ActionController::Parameters with user_id now merged into the current post_params
    if @post.save
      flash[:success] = "Your post has been created successfully"
      redirect_to posts_path
      # returns '/posts'
    else
      flash.now[:alert] = "Your post wasn't uploaded. Please try again"
      # if using render method change to flash.now
      render :new
      # We can give render the name of an action to cause the corresponding view template to be rendered.
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
