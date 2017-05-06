class CommentsController < ApplicationController

  def create
    picture = Picture.find(params[:picture_id])
    comment = picture.comments.new(comment_params)
    comment.user = current_user
    comment.save
    redirect_to pictures_path
  end

  def comment_params
    params.require(:comment).permit(:opinion)
  end

end
