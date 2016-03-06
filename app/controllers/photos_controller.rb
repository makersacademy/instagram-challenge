class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def photos_params
    params.require(:restaurant).permit(:name, :image)
  end

end
