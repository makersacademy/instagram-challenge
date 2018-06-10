class PostsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_post, only: [:edit, :update, :destroy, :upvote]

  def index
    @post = Post.new
    @posts = Post.all.reverse
    @user = current_user
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

  def upvote
    @post = Post.find(params[:id])
    if current_user.liked? @post
      @post.unliked_by current_user
    else
      @post.liked_by current_user
    end
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:photo, :caption)
  end
end
