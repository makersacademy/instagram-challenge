class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def create
  end
  
  private
  def picture_params 
    params.require(:image).permit(:caption)
  end
end
