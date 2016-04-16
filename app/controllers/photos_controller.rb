class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
  end

end
