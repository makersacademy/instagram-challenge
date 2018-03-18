class CommentsController < ApplicationController

  def create
    image = Image.find(params[:image_id])
    comment = image.comments.new(comment_params)
    comment.save
    redirect_to image
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :commenter)
  end

end
