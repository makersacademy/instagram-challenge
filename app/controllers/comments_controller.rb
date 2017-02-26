class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    picture = Picture.find(params[:picture_id])
    picture.comments.create(review_params)
    redirect_to pictures_path
  end

private

  def review_params
    params.require(:comment).permit(:thoughts)
  end

end
