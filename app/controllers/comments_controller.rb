class CommentsController < ApplicationController

before_action :authenticate_user!
  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.comments.create(comment_params)
    redirect_to picture_path(@picture)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
