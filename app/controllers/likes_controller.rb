class LikesController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.likes.create
    # redirect_to photos_path
    render json: { new_like_count: @photo.likes.count }
  end
end
