class LikesController < ApplicationController
  def create
    @photo = Photo.find(params[:picture_id])
    @photo.likes.create
    redirect_to photos_path
  end
end
