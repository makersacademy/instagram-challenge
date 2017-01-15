class CommentsController < ApplicationController
  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @photo = Photo.find(params[:photo_id])
    @photo.comments.create(comment_params)
    redirect_to photo_path(@photo)
  end

  private
  def comment_params
    params.require(:comment).permit(:remarks, :user_id)
  end
end
