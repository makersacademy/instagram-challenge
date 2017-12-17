class LikesController < ApplicationController

  def create
    photo.likes.create
  end

  def photo
    photo = Photo.find_by(id: params[:photo_id])
  end

  def destroy
    like = Like.last
    like.destroy
  end

end
