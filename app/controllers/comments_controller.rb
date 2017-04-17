class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
      @image = Image.find(params[:image_id])
      @comment = @image.comments.build(comment_params)
      @comment.user = current_user
      @comment.save
      redirect_to '/images'
  end

  def comment_params
  params.require(:comment).permit(:message)
  end
end
