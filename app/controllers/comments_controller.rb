class CommentsController < ApplicationController

  def create
    parametry = comment_params
    parametry[:content] = params['comment']['content']
    @comment = Comment.new(parametry)
    if @comment.save then
      flash[:notice] = "Thank you for your comment"
      redirect_to '/photos'
    else
      flash[:notice] = "Your comment is too long."
      redirect_to '/photos'
    end
  end

  def comment_params
    params.permit(:user_id, :photo_id)
  end

end
