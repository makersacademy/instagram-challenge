class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    if @picture.comments.build(comment_params).save
       flash[:success] = "Comment saved!"
       redirect_to current_user
    else
       flash[:alert] = "Unable to save comment"
       redirect_to current_user
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
