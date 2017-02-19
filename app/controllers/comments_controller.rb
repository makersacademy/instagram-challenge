class CommentsController < ApplicationController
  def new
  @picture = Picture.find(params[:picture_id])
  @comment = Comment.new
end

def create
  @picture = Picture.find params[:picture_id]
  @comment = @picture.build_comment comment_params, current_user
  if @comment.save
    redirect_to pictures_path
  else
    if @comment.errors[:user]
      # Note: if you have correctly disabled the review button where appropriate,
      # this should never happen...
      redirect_to pictures_path, alert: 'You have already commented on this picture'
    else
      # Why would we render new again?  What else could cause an error?
      render :new
    end
  end
end

private

def comment_params
  params.require(:comment).permit(:thoughts)
end
end
