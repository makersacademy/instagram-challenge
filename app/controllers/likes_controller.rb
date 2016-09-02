class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = Comment.find(params[:comment_id])
    @comment.likes.create
    render json: {new_like_count: @comment.likes.count}
  end
end
