class CommentsController < ApplicationController
  before_action :set_photo
  before_action :authenticate_user!

  def create 
    @comment = @photo.comments.create(comment_params)
    @comment.user_id = current_user.id
    redirect_to photos_path
  end

  def destroy
    @comment = @photo.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment has been deleted"
    redirect_to photo_path(@photo)
  end

  private

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

  def set_photo
    @photo = Photo.find(params[:photo_id])
  end
end
