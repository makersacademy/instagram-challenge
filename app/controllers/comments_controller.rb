class CommentsController < ApplicationController

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.build_with_user({ text: params[:comment_text] }, current_user)
    if @comment.save
      render json: { comment_saved: true,
                     new_comment_text: @comment.text,
                     user_name: @comment.user.user_name,
                     image_id: @image.id }
    else
      render json: { comment_saved: false,
                     new_comment_text: @comment.text,
                     user_name: @comment.user.user_name,
                     image_id: @image.id }
    end
  end

end
