class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @image = Image.find params[:image_id]
    @comment = Comment.new
  end

  def create
    @image = Image.find params[:image_id]
    @comment = @image.comments.build_with_user(comment_params, current_user)
    if @comment.save
      redirect_to image_path(@image)
    else
      redirect_to new_image_comment_path(@image), alert: 'Cannot post an empty comment'
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
