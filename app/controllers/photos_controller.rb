class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end
end
