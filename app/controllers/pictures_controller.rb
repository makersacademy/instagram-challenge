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

  def edit
    @gallery = Gallery.find(params[:gallery_id])
    @picture = Picture.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:gallery_id])
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      flash[:notice] = "The \"#{@picture.title}\" picture was successfully edited"
      redirect_to "/galleries/#{@gallery.id}"
    else
      # I can only see validation errors if I use "render 'new'" here.
      flash[:error] = @picture.errors
      p @picture.errors
      redirect_to "/galleries/#{@gallery.id}/pictures/#{@picture.id}/edit"
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
