class PicturesController < ApplicationController

  def index
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.new(picture_params)
    if @picture.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def picture_params
    params.require(:picture).permit(:image, :description)
  end

end
