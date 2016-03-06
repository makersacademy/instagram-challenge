class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def photo_params
  	params.require(:photo).permit(:caption, :image, :tags, :bucket)
  end

  def index
    @photos = Photo.all.reverse
  end

  def new
    @photos = Photo.new
  end

  def create
  	@newphoto = Photo.create(photo_params)
    @newphoto.user_id = current_user.id
    if @newphoto.save
      redirect_to photos_path
    else
      render 'new'
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
    @photo.update(photo_params)
    flash[:notice] = 'Don\'t worry, nobody will ever know.'
    redirect_to "/photos"
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.user_id == current_user.id
      @photo.destroy
      flash[:notice] = 'It\'s like it never even existed.'
    else
      flash[:notice] = 'You can\'t delete somebody else\'s photos!'
    end
    redirect_to "/photos"
  end

end
