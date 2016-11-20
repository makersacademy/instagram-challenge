class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to picture_path(@picture)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
