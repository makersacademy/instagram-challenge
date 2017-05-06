class PhotosController < ApplicationController
  def index
  end

  def new
    @picture = Photo.new
  end
end
