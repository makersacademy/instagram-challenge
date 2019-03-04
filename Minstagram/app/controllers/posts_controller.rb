class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy, :like, :dislike]
  before_action :authenticate_user!

  def index
    @posts = Post.all.order("updated_at DESC")
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to :action => 'index'
    else
      flash.now[:notice] = "Error saving your new note, please try again!"
      redirect_to posts_url
    end
  end

  def show
    # find_post
  end

  def edit
    # find_post
  end

  def update
    # find_post
    if @post.update_attributes(post_params)
      redirect_to posts_path
    else
      flash.now[:alert] = "Couldn't update your Minsta, please try again or cancel!"
      render 'edit'
    end
  end

  def destroy
    # find_post
    if @post.destroy
      flash[:alert] = "Your Minsta has been deleted successfully"
      redirect_to :action => 'index'
    else
      flash.now[:alert] = "We couldn't delete your Minsta, please try again!"
      render 'show'
    end
  end

  def like
    @current = current_user.id.to_s
    @post.likes = @post.like(@post.id, @current)
    @post.dislikes = @post.remove_dislike(@post.dislikes, @current)
    @post.likes = ',' if @post.likes == nil
    @post.dislikes = ',' if @post.dislikes == nil
    Post.find(@post.id).update_column(:likes, @post.likes)
    Post.find(@post.id).update_column(:dislikes, @post.dislikes)

    redirect_to posts_path(anchor: @post.id)
  end

  def dislike
    @current = current_user.id.to_s
    @post.dislikes = @post.dislike(@post.id, @current)
    @post.likes = @post.remove_like(@post.likes, @current)
    @post.likes = ',' if @post.likes == nil
    @post.dislikes = ',' if @post.dislikes == nil
    Post.find(@post.id).update_column(:dislikes, @post.dislikes)
    Post.find(@post.id).update_column(:likes, @post.likes)

    redirect_to posts_path(anchor: @post.id)
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:message, :user_id, :image)
  end
end
