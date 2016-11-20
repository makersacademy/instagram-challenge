class PicturesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def new
    @gallery = Gallery.find(params[:gallery_id])
    @picture = Picture.new
  end

  def create
    @gallery = Gallery.find(params[:gallery_id])
    @picture = @gallery.pictures.new(picture_params)
    if @picture.save
      flash[:notice] = "The \"#{@picture.title}\" picture was successfully created"
      redirect_to "/galleries/#{@gallery.id}"
    else
      render 'new'
    end
  end

  def destroy
    @gallery = Gallery.find(params[:gallery_id])
    @picture = Picture.find(params[:id])
    if @gallery.pictures.destroy(@picture)
      flash[:notice] = "The \"#{@picture.title}\" picture was successfully deleted"
      redirect_to "/galleries/#{@gallery.id}"
    else
      render 'new'
    end
  end

  private
  def picture_params
    params.require(:picture).permit(:title)
  end
end
