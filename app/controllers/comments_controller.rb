class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    if current_user.has_commented?(Picture.find(params[:picture_id]))
      raise 'already commented on this one matey, please deal with error'
    else
      @picture = Picture.find(params[:picture_id])
      @comment = Comment.new
    end
  end

  def create
    if current_user.has_commented?(Picture.find(params[:picture_id]))
      raise 'already commented on this one matey, please deal with error'
    else
      @picture = Picture.find(params[:picture_id])
      @comment = @picture.comments.new(comment_parameters)
      @comment.user = current_user
      @comment.save
      redirect_to pictures_path
    end
  end

  def comment_parameters
    params.require(:comment).permit(:comment)
  end

end
