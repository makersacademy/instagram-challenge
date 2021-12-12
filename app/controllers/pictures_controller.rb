class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
  end

  def create
    redirect_to root_path
  end
  
  private
  def picture_params 
    params.require(:image).permit(:caption)
  end
end
