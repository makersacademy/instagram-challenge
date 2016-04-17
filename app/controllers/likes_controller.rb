class LikesController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.likes.create(user: current_user)
    redirect_to photos_path
  end

end
