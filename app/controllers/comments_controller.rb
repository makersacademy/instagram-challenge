class CommentsController < ApplicationController

  def create
    @picture = Picture.find(comment_params[:picture_id])
    @comment = @picture.comments.create(comment_params)

    redirect_to "/"
  end

  private

  def comment_params
    params.require(:comment).permit(:picture_id, :body, :commenter)
  end

end
