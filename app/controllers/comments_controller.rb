class CommentsController < ApplicationController

  def create
    picture = Picture.find(params[:picture_id])
    picture.comments.create(comment_params)
    redirect_to pictures_path
  end

  def comment_params
    params.require(:comment).permit(:opinion)
  end

end
