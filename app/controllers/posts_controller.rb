class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    @posts = Post.all.reverse
  end

  def create
    if params[:post][:photo].blank? || params[:post][:caption].blank?
      flash[:failure] = 'You must have a valid photo AND caption!'
    else
      @post = current_user.posts.create(post_params)
    end
    redirect_to posts_url
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

  def post_params
    params.require(:post).permit(:photo, :caption)
  end
end
