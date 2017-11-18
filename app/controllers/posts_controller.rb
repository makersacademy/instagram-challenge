# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  before_action :authenticate_user! , except: [ :index, :show ]
  def index
    @posts = Post.order('created_at DESC')
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :remove_image, :image_cache)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
