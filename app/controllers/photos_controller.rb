class PhotosController < ApplicationController
  def index
  end

  def new
    @photo = Photo.new
  end
end
