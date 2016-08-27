class CommentsController < ApplicationController
  def new
    @picture = Picture.find(params[:picture_id])
    @comment = current_user.comments.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to @picture
  end

  def destroy
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment deleted successfully'
    redirect_to @picture
  end

  private

  def comment_params
    params.require(:comment).permit(:thoughts)
  end
end
