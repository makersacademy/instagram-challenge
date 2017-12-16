module Api
  class PhotosController < ApplicationController
    def index
      render :json => { photos: Photo.all.reverse }
    end
  end
end
