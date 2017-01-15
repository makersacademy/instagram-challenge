class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.comments.create(comment_params)
    redirect_to picture_path(@picture)
  end

  def destroy
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'comment deleted'
    redirect_to picture_path(@picture)
  end

  private

  def comment_params
    params.require(:comment).permit(:thoughts, :rating)
  end
end
