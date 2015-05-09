class CommentsController < ApplicationController

  def new
    @image = Image.find(params[:image_id])
    @comment = Comment.new
  end

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.new(comment_params)
    if @comment.save
      redirect_to image_path(@image)
    else
      render 'new'
    end
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
