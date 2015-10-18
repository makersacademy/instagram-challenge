class FavouritesController < ApplicationController

  def create
    @photo = Photo.find(params[:comment_id])
    @photo.favourites.create
    redirect_to photos_path
  end

end
