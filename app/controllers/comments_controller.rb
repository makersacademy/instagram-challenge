class CommentsController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.create(comment_params)
    redirect_to action: "show"
  end

  private

  def comment_params
    params.require(:comment).permit(:picture_id, :body, :commenter)
  end

end
