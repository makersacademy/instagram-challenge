class CommentsController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      render '/'
    else
      render '/'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:words)
  end

end
