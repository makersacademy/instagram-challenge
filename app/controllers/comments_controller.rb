class CommentsController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.comments.create(comment_parameters)
    redirect_to pictures_path
  end

  def comment_parameters
    params.require(:comment).permit(:comment)
  end

end
