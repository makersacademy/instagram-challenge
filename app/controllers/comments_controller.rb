class CommentsController < ApplicationController

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.create_with_user({ text: params[:comment_text] }, current_user)
    render json: { new_comment_text: @comment.text,
                   user_name: @comment.user.user_name,
                   image_id: @image.id }
  end

end
