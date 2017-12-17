module Api
  class CommentsController < ApplicationController

    def show
    end

    def index
      render :json => { comments: photo.comments }
    end

    private

    def photo
      Photo.find_by(id: params[:photo_id])
    end

  end
end
