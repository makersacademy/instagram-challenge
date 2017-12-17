module Api
  class LikesController < ApplicationController
    protect_from_forgery except: :create

    def index
      render json: { likes: likes }, status:200
    end

    def create
      photo = Photo.find_by(id: photo_id)
      photo.likes << Like.new
      photo.save
      redirect_to "/"
    end

    private

    def likes
      Like.where(photo_id: photo_id)
    end

    def photo_id
      params.require(:photo_id)
    end

  end
end
