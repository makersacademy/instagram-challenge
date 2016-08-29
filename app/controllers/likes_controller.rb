class LikesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @post = Post.find(params[:post_id])
    render json: { likes_count: @post.likes.count }
  end

  def create
    @post = Post.find(params[:post_id])
    @post.likes.create_with_user({}, current_user)
    render json: { new_likes_count: @post.likes.count }
  end
end
