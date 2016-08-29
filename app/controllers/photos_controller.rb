class PhotosController < ApplicationController

  before_action :find_photo_params, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except:[:index]

  def index
    @photos = Photo.all.order('created_at DESC')
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    if @photo.save
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    @photo.update(photo_params)
    redirect_to root_path
  end

  def destroy
    @photo.destroy
    flash[:notice] = 'Post successfully deleted'
    redirect_to root_path
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end

  def find_photo_params
    @photo = Photo.find(params[:id])
  end

end
