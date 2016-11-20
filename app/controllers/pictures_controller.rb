class PicturesController < ApplicationController
  def new
    @gallery = Gallery.find(params[:gallery_id])
    @picture = Picture.new
  end

  def create
    @gallery = Gallery.find(params[:gallery_id])
    @gallery.pictures.create(picture_params)
    redirect_to "/galleries/#{@gallery.id}"
  end

  def destroy
    @gallery = Gallery.find(params[:gallery_id])
    @picture = Picture.find(params[:id])
    @gallery.pictures.destroy(@picture)
    redirect_to "/galleries/#{@gallery.id}"
  end

  private
  def picture_params
    params.require(:picture).permit(:title)
  end
end
