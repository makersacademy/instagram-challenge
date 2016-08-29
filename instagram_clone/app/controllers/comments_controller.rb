class CommentsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.create(comment_params)
    @comment.user = current_user
    redirect_to "/pictures"
  end

  private

  def comment_params
    params.require(:comment).permit(:thoughts)
  end


end
