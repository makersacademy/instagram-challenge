class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create ( picture_params )
    redirect_to pictures_path
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:image, :description) #may need to add extra criteria to strong params
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)

    redirect_to '/pictures'
  end


end
