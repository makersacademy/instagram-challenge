class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to picture_path(params[:picture_id])
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
