class PhotosController < ApplicationController
  def index
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    redirect_to photos_path
  end

private
def post_params
  params.require(:post).permit(:image, :caption)
end

end
