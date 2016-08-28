class CommentsController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.comments.create(comments_params)
    redirect_to pictures_path
  end

  private

  def comments_params
    params.require(:comment).permit(:text, :like)
  end

end
