class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.picture = @picture
    comment.save
    redirect_to '/pictures'
  end

  private

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

end
