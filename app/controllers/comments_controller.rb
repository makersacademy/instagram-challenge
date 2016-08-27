class CommentsController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.comments.create_with_user(comment_params, current_user)
    redirect_to photo_path(@photo)
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    redirect_to photo_path(@photo)
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
