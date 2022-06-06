module Api
  class LikesController < ApplicationController
    protect_from_forgery except: :create

    def index
      render json: { likes: likes }, status:200
    end

    def create
      photo = Photo.find_by(id: photo_id)
      like = Like.new
      photo.likes << like
      current_user.likes << like
      photo.save
      current_user.save
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
