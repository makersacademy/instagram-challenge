class PhotosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    Photo.user_create_photo(photo_params, current_user.id)
    redirect_to '/photos'
  end

  def show
    @photo = Photo.find(params[:id])
    @user = User.find(@photo.user_id)
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)

    redirect_to '/photos'
  end
  private

    def photo_params
      params.require(:photo).permit(:caption, :image)
    end
end
