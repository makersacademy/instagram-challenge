class PicturesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    current_user.pictures.create(picture_params)
    redirect_to pictures_path
  end

  def picture_params
    params.require(:picture).permit(:image)
  end
end
