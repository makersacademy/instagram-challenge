class PhotosController < ApplicationController

  def index
    @photo = Photo.all
  end
end
