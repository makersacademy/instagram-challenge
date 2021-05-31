# frozen_string_literal: true

class PostsController < ApplicationController
  require 'mini_magick'
  before_action :authenticate_user!
  before_action :owned_post, only: %i[edit update destroy]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Posted successfully'
      redirect_to(@post)
    else
      flash[:alert] = 'Please add an image'
      render(:new)
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    if @post.destroy
      flash[:success] = 'Post deleted'
      redirect_to(posts_path)
    else
      render(:edit)
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def owned_post
    @post = Post.find(params[:id])
    unless current_user == @post.user
      flash[:alert] = "Cannot delete another user's post"
      redirect_to(root_path)
    end
  end
end
