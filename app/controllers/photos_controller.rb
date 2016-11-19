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
        flash[:notice] = "Please attach a photo"
        redirect_to '/photos/new'
      end
    end

    def show
      @photo = Photo.find(params[:id])
    end

    def edit
      @photo = Photo.find(params[:id])
    end

    def update
      @photo = Photo.find(params[:id])
      @photo.user_id == current_user.id
      @photo.update(photo_params)
      redirect_to '/photos'
    end

    def destroy
      @photo = Photo.find(params[:id])
      @photo.user_id == current_user.id
      @photo.destroy
      flash[:notice] = 'Photo deleted'
      redirect_to '/photos'
    end

    private

    def photo_params
      params.require(:photo).permit(:caption, :image)
    end

  end
