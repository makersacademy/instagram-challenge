class CommentsController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.comments.create(comment_params)
  end

  def comment_params
    params.require(:comment).permit(:comments)
  end
end
