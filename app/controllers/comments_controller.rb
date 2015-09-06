class CommentsController < ApplicationController

  def create
      @image = Image.find(params[:image_id])
      @image.comments.create(comment_params)
      redirect_to '/images'
  end

  def comment_params
  params.require(:comment).permit(:message)
  end
end
