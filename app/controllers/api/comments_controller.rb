module Api
  class CommentsController < ApplicationController
    protect_from_forgery except: :create

    def index
      render json: { comments: comments }, status:200
    end

    def create
      photo = Photo.find_by(id: photo_id)
      photo.comments << Comment.new(text: params[:text])
      photo.save
      redirect_to "/"
    end

    private

    def comments
      Comment.where(photo_id: photo_id)
    end

    def photo_id
      params.require(:photo_id)
    end

  end
end
