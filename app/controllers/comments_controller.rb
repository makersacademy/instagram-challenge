class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @image = Image.find(params[:image_id])
    @comment = Comment.new
  end

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.create_with_user(comment_params, current_user.username)
    redirect_to images_path
  end

  def comment_params
    params.require(:comment).permit(:comments)
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user.username == @comment.username
      @comment.destroy
      flash[:notice] = 'Comment deleted successfully'
      redirect_to '/images'
    else
      flash[:notice] = "You can not delete someone else's comment"
      redirect_to '/images'
    end
  end
end
