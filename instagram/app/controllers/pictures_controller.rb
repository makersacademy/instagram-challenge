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

  def picture_params
    params.require(:picture).permit(:image, :description) #may need to add extra criteria to strong params
  end


end
