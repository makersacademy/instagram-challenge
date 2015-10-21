class UpvotesController < ApplicationController

  def create
    @comment = Comment.find(params[:comment_id])
    @comment.upvotes.create
    render json: {new_upvote_count: @comment.upvotes.count}
  end


end
