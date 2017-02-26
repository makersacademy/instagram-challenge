class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end
end
