class LikesController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.likes.create
      redirect_to root_path
  end
end
