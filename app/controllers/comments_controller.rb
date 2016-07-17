class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
      @picture = Picture.find(params[:picture_id])
      @comment = @picture.comments.new(comment_parameters)
      @comment.user = current_user
      @comment.save
      redirect_to pictures_path
  end

  def comment_parameters
    params.require(:comment).permit(:comment)
  end

end
