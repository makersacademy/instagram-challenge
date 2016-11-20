class CommentsController < ApplicationController

  before_action do
    @currentUser = current_user.id
  end

  def new
    if !user_signed_in?
      redirect_to '/feeds'
    end
  p  @comment = Comment.new
  p "at new"
  end

  def create
    p "at create"
    @comment = Comment.new(comment_params)
    p @comment
  p  @comment.photo_id = params[:photo_id]
    p @comment.user_id = @current_user.id
    @comment.save
    p @comment
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
