class CommentsController < ApplicationController

  def new
    @image = Image.find(params[:image_id])
    @comment = Comment.new
  end

  def create
    @image = Image.find(params[:image_id])
    @image.comments.create(comments_params)
  end

  private

  def comments_params
    params.require(:comment).permit(:comments)
  end

end
