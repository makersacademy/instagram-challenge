class PhotoLikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    photo = Photo.find(params[:photo_id])
    photo_like = PhotoLike.new
    photo_like.photo = photo
    photo_like.save
    redirect_to photos_path
  end
end
