class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

    def index
      @photos = Photo.all
    end

    def new
      @photo = Photo.new
    end

    def create
      @photo = Photo.create(photo_params)
      @photo.user_id = current_user.id
      if @photo.save
        redirect_to '/photos'
      else
        flash[:notice] = "Must include a photo"
        redirect_to '/photos/new'
      end
    end

    def show
      @photo = Photo.find(params[:id])
    end

    def edit
      @photo = Photo.find(params[:id])
      if @photo.user_id != current_user.id
        flash[:notice] = 'Cannot edit photos you did not upload'
        redirect_to '/photos'
      end
    end

    def update
      @photo = Photo.find(params[:id])
      if @photo.user_id == current_user.id
        @photo.update(photo_params)
      else
        flash[:notice] = 'Cannot edit photos you did not upload'
      end
      redirect_to '/photos'
    end

    def destroy
      @photo = Photo.find(params[:id])
      if @photo.user_id == current_user.id
        @photo.destroy
        flash[:notice] = 'Photo deleted successfully'
      else
        flash[:notice] = 'Cannot delete photos you did not upload'
      end
      redirect_to '/photos'
    end

    private

    def photo_params
      params.require(:photo).permit(:caption, :image)
    end

  end
