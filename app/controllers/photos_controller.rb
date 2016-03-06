class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def photo_params
  	params.require(:photo).permit(:caption, :image, :tags)
  end

  def index
    @photos = Photo.all
  end

  def new
    @photos = Photo.new
  end

  def create
  	@newphoto = Photo.create(photo_params)
    @newphoto.user_id = current_user.id
    if @newphoto.save
      redirect_to '/'
    else
      render 'new'
    end
  end
end
