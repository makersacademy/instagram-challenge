class CommentsController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.build(comment_params.merge(user: current_user))
    @comment.save
    redirect_to pictures_path
  end

  def comment_params
    params.require(:comment).permit(:thoughts)
  end
end