module Api
  class PhotosController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  skip_before_action :verify_authenticity_token

    def index
      photos = Photo.all
      render json: { photos: photos }
    end

    def show
      render :json => { photo: photo }
    end

    private

    def photo
      photo ||= Photo.find_by!(id: id)
    end

    def id
      params.require(:id)
    end

    def record_not_found
      render json: { errors: ["Couldn't find photo {id: #{id}}"] }, status: 500
    end

  end
end
