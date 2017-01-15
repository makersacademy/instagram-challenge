class PhotosController < ApplicationController
  before_action :find_photo, only: [:show, :edit, :update, :destroy]

  def index
    @photos = Photo.all.order("created_at DESC")
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create_user.photos.build(photo_params)

    if @photo.save
      redirect_to @photo, notice: "Photo submitted"
    else
      render 'new'
    end

  end

  def show
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      redirect_to @photo, "Photo was updated"
    else
      render 'edit'
    end
  end

  def destroy
    @photo.destroy
    redirect_to 'root_path'
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description)
  end

  def find_photo
      @photo = Photo.find(params[:id])
  end
end
