class CommentsController < ApplicationController
  def new
    @image = Image.find(params[:image_id])
    @comment = Comment.new
  end
  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to images_path
  end
  def comment_params
    params.require(:comment).permit(:thoughts)
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment deleted successfully"
    redirect_to images_path
  end
end
