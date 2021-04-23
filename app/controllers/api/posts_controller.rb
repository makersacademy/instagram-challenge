class Api::PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
    json_response(@posts)
  end

  def create
    @posts = Post.create!(post_params)
    json_response(@posts, :created)
  end

  def show
    @post = Post.find(params[:id])
    json_response(@post)
  end

  def update
    @post.update(post_params)
    json_response(@post)
  end

  def destroy
    @post.destroy
    head :no_content
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.permit(:image, :user_id, :description)
  end
end
