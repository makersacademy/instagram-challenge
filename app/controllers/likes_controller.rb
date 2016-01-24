class LikesController < ApplicationController

  def create
    photo = Photo.find(params[:photo_id])
    like = photo.likes.create()
    render json: { likes_count: photo.likes.count }
  end

  def like_params
    params.require(:photo).permit(:photo_id)
  end
end
