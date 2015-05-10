class PhotosController < ApplicationController

before_action :authenticate_user!, except: :index

  def index
    @photos = Photo.all.includes(:comments)
  end

  def new
    @photo = Photo.new
  end

  def create
    photo = Photo.create(create_photo_params)
    redirect_to '/photos'
  end

  def create_photo_params
    params.require(:photo).permit(:message, :image).merge({user_id: current_user.id})
  end

end
