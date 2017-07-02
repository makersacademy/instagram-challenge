class PhotosController < ApplicationController

    before_action :authorize, only: [:create, :new]

    def new
    end

    def create
        @photo = Photo.new(photo_params)
 
        @photo.save
        redirect_to @photo
    end

    def index
        @photos = Photo.all
    end

    def show
        @photo = Photo.find(params[:id])
    end
 
private
    def photo_params
        params.require(:photo).permit(:title, :image_file)
    end
end
