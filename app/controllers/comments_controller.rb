class CommentsController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    Comment.create(photo_params.merge(photo: @photo, user: current_user))
    redirect_to photo_path(@photo)
  end

  def photo_params
    params.require(:comment).permit(:comment)
  end
end
