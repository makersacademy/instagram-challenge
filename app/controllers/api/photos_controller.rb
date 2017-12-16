module Api
  class PhotosController < ApplicationController
    def index
      render :json => { photos: Photo.all.reverse }
    end

    def show
      render :json => { photo: photo }
    end

    private

    def photo
      Photo.find_by(id: params[:id])
    end

  end
end
