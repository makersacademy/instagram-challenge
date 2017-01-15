class PhotosController < ApplicationController
  def index
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)

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
  end

  def destroy
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description)
  end
end
