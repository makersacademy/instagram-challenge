class CommentsController < ApplicationController
  def new
    @image = Image.find(params[:image_id])
    @comment = Comment.new
  end

  def create
    image = Image.find(params[:image_id])
    @comment = image.comments.create(comment_params)
    redirect_to('/')
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end


end
