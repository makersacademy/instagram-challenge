class CommentsController < ApplicationController

  def create
    image = Image.find(params[:image_id])
    comment = image.comments.new(comment_params)
    comment.save
    if comment.errors.messages.empty?
      redirect_to image
    else
      messages = ""
      comment.errors.full_messages.each do |message|
        messages += message
      end
      flash[:notice] = messages
      redirect_to image
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :commenter)
  end

end
