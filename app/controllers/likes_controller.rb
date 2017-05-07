class LikesController < ApplicationController

  def new
    create
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.likes.create
    redirect_to "/photos/#{@photo.id}"
  end

end
