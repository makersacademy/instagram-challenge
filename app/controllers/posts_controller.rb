class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    @posts = Post.all.reverse
  end

  def create
    if params[:post].blank?
      flash[:failure] = 'You must select a valid photo!'
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
    params.require(:post).permit(:photo)
  end
end
