class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @image = Image.find params[:image_id]
    @comment = Comment.new
  end

  def create
    @image = Image.find params[:image_id]
    @comment = @image.comments.create_with_user(comment_params, current_user)
    redirect_to image_path(@image)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
