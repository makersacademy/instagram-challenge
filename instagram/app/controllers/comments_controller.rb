class CommentsController < ApplicationController
  def new
    @image = Image.find(params[:image_id])
    @comment = Comment.new
  end

  def create
    @image = Image.find(params[:image_id])
    @image.comments.create(comment_params)
    redirect_to image_path(@image)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
