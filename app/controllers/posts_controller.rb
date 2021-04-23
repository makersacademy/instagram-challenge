class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
    render json: @posts
  end

  def create
    @posts = Post.create(post_params)
    json_response(@posts, :created)
  end

  def show
    @post = Post.find(params[:id])
    json_response(@post)
  end

  def destroy
  end

  private

  def post_params
    params.permit(:image, :user_id, :description)
  end
end
