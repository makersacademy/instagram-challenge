class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like, :unlike]
  before_action :owned_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.order('created_at DESC').page params[:page]
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Your post has been created.'
      redirect_to posts_path
    else
      flash[:alert] = 'Your post could not be created, please check your form or try again later.'
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post successfully updated.'
      redirect_to posts_path
    else
      flash.now[:alert] = 'Update failed,  please check your form or try again later.'
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'Post successfully deleted.'
    redirect_to posts_path
  end

  def like
    if @post.liked_by current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  def unlike
    if @post.unliked_by current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def owned_post
    unless current_user.id == @post.user.id
      flash[:alert] = "That post doesn't belong to you!"
      redirect_to root_path
    end
  end
end
