# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :destroy]
  def index
    @posts = Post.order("created_at DESC")
  end

  def show
    @post = Post.includes(comments: :user).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))
    if @post.save
      flash[:success] = "Thanks for posting!"
      redirect_to posts_url
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @post.update_attributes(post_params)
    flash[:success] = "Post updated!"
    redirect_to post_path(@post)
  end

  def destroy
    if @post
      @post.destroy
      flash[:success] = "Post deleted!"
      redirect_to posts_url
    else
      flash[:danger] = "Unable to delete post!"
      render 'index'
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
