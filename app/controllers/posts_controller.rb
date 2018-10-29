# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :remove_image]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))
    @post.save ? (redirect_to welcome_index_url, notice: 'Post was successfully created.') : (render :new)
  end

  def update
    @post.update(post_params) ? (redirect_to welcome_index_path, notice: 'Post was successfully updated.') : (render :edit)
  end

  def destroy
    @post.destroy
    redirect_to welcome_index_path, notice: 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:description, :image, :user_id)
  end
end
