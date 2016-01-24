class LikesController < ApplicationController

  def create
    photo = Photo.find(params[:photo_id])
    if current_user.has_liked?(photo)
      like = photo.likes.find(user_id: current_user.id)
      like.destroy
    else
      photo.likes.create(user_id: current_user.id)
    end
    render json: { likes_count: photo.likes.count }
  end

  def like_params
    params.require(:photo).permit(:photo_id)
  end
end
