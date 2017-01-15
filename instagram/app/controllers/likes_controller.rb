class LikesController < ApplicationController
  def create
    @photo = Photo.find(params[:photo_id])
    @like = photo.likes.create
    redirect_to photos_path
end
