class CommentsController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.build_comment(comment_params, current_user)
    redirect_to pictures_path
  end

  def comment_params
    params.require(:comment).permit(:thoughts)
  end
end

