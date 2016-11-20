class CommentsController < ApplicationController

  before_action do
    @currentUser = current_user.id
  end

  def new
    if !user_signed_in?
      redirect_to '/feeds'
    end
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.photo_id = params[:photo_id]
    @comment.user_id = @current_user.id
    @comment.save
    flash[:notice] = "comment successfully posted"
    redirect_to '/feeds'
  end

  def edit
  end

  def delete
  end

  private
  def comment_params
    params.require(:comment).permit(:description)
  end
end
