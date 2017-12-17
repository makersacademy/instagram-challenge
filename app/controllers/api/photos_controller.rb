module Api
  class PhotosController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  skip_before_action :verify_authenticity_token

    def index
      photos = Photo.all
      render json: { photos: photos }
    end

  end
end
