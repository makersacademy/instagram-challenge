class PhotosController < ApplicationController

  # has_one_attached :image

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
  end

  def create

    # @value = Cloudinary::Uploader.upload(params[:link])
    @photo = Photo.new(photo_params)
    # @photo = Photo.new({:link => @value['secure_url'], :caption => params[:caption]})

    @photo.save
    redirect_to @photo
  end

  private
    def photo_params
      params.require(:photo).permit(:image, :caption)
    end

end
