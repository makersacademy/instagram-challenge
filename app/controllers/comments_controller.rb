class CommentsController < ApplicationController

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.build_comment comment_params, current_user
    @comment.save
    redirect_to photos_path
  end

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user.id == @comment.user_id
      @comment.destroy
      flash[:notice] = 'Comment deleted successfully'
      redirect_to photos_path
    else
      redirect_to photos_path, alert: 'You can only delete your comment'
    end
  end

end
