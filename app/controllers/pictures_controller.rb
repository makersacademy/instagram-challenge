class PicturesController < ApplicationController

before_action :authenticate_user!

  def index
    
  end

  def new

  end

  def create
    picture = Picture.create(picture_params)
    picture.user = current_user
    picture.save
    redirect_to '/'
  end

  def picture_params
    params.require(:picture).permit(:name)
  end

end
