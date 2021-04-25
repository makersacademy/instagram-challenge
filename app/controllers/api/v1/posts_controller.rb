class Api::V1::PostsController < ApplicationController
  def index
    @posts = Post.all
    json_response(@posts)
  end

  def create
    @post = Post.create!(post_params)
    json_response(@post, :created)
  end

  def show
    @posts = Post.find_by(id: params[:id])
    json_response(@posts)
  end

  def destroy
  end

  private

  def post_params
    params.permit(:username, :description, :image, :user_id)
  end
end
