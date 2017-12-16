module Api
  class PhotosController < ApplicationController
    def index
      render :json => { photos: Photo.all }
    end
  end
end
