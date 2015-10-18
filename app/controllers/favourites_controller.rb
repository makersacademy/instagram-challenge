class FavouritesController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.favourites.create
    render json: {new_favourite_count: @photo.favourites.count}
  end

end
