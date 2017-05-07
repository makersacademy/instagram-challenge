class CommentsController < ApplicationController

  def create
    picture = Picture.find(params[:picture_id])
    comment = picture.build_comment(comment_params, current_user)
    if comment.save
      redirect_to pictures_path
    end
  end

  def comment_params
    params.require(:comment).permit(:opinion)
  end

end
