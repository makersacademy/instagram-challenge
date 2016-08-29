class CommentsController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.comments.create_with_user(comments_params, current_user)
    redirect_to pictures_path
  end

  private

  def comments_params
    params.require(:comment).permit(:text, :like)
  end

end
