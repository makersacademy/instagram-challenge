class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
    @tag = Tag.new
  end

  def create
    photo = Photo.new(photo_params)
    photo.user = current_user
    tag_array = tag_params['phrase'].split(' ')
    tag_array.each do |t|
      tag = Tag.find_or_initialize_by({'phrase'=>t})
      photo.tags << tag
    end
    photo.save
    redirect_to photos_path
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
    Photo.destroy(params[:id])
    redirect_to photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :image)
  end

  def tag_params
    params.require(:photo).require(:tag).permit(:phrase)
  end
end
