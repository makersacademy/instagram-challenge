class PhotosController < ApplicationController

  def index
    @photos = Photo.count
  end

end
