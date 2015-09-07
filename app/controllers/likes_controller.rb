class LikesController < ApplicationController

  def create
    @comment = Comment.find(params[:comment_id])
    @comment.likes.create
    render json: {new_like_count: @comment.likes.count}
  end

end
