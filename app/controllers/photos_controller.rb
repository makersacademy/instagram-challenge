class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def create
    redirect_to photos_path
  end

end
