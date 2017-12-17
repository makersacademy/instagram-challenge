module Api
  class PhotosController < ApplicationController
    def index
      render :json => { photos: photos_with_likes }
    end

    def show
      render :json => { photo: one_photo_with_likes }
    end

    private

    def photo
      Photo.find_by(id: params[:id])
    end

    def photos_with_likes
      array = []
      Photo.all.each do |photo|
        array << { id: photo.id, photo: photo.photo, description: photo.description, likes: photo.likes.length }
      end
      array.reverse
    end

    def one_photo_with_likes
      { id: photo.id, photo: photo.photo, description: photo.description, likes: photo.likes.length }
    end

  end
end
