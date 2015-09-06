class CommentsController < ApplicationController
  def create
    @photo = Photo.find(params[:photo_id])
    @photo.comments.create(comment_params)
    redirect_to photo_path(@photo)
  end

  def comment_params
    params.require(:comment).permit(:contents)
  end
end
