require "mini_magick"

class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      flash[:notice] = "Post failed - please try again."
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id
      @post.update(post_params)
      redirect_to '/posts'
    else
      flash[:notice] = "You don't have permission to edit this post."
      render 'edit'
    end
  end

  def like
    @post = Post.find(params[:id])
    if @post.liked_by current_user
          respond_to do |format|
            format.html { redirect_to :back }
            format.js
          end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id
      @post.destroy
      flash[:notice] = 'Post deleted successfully'
      redirect_to '/posts'
    else
      flash[:notice] = "You don't have permission to delete this post."
      render 'edit'
    end
  end


  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

end
