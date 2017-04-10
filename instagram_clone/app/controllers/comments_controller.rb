class CommentsController < ApplicationController
  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.comments.create(comment_params.merge(:user => current_user))
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
