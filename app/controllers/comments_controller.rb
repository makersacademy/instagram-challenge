class CommentsController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.comment.create(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
