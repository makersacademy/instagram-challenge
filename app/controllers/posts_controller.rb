# frozen_string_literal: true
require 'pry'

class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @post = Post.new
    @posts = Post.order(created_at: :desc)
  end

  def like
    @likeable = Post.find(params[:id])

    like = Like.find_by({likeable: @likeable, user: current_user})
    if like
      like.destroy
      flash = "Like Removed!"
    else
      Like.create(likeable: Post.find(params[:id]), user: current_user)
      flash = "Like Counted!"
    end
    respond_to do |format|
      format.html do
        flash[:notice] = flash
        redirect_to posts_url
      end
      format.js { render :file => "/app/views/likes/like.js.erb" }
    end
  end

  private

  def post_params
    params.require(:post).permit(:photo).merge(user: current_user)
  end

end
