class CommentsController < ApplicationController
  def create
    photo = Photo.find(params[:photo_id])
    photo.comments.create(comments_params)
    redirect_to photos_path
  end

  def comments_params
    params.require(:comment).permit(:content)
  end
end
