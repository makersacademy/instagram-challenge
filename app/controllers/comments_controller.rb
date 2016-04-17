class CommentsController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.comments.create(comments_params)
    redirect_to picture_path(@picture)
  end

  def comments_params
    params.require(:comment).permit(:comment)
  end
end
