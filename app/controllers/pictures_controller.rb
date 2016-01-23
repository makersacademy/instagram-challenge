class PicturesController < ApplicationController
  def index
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to pictures_path
    else
      redirect_to pictures_new_path
      flash[:error] = 'An error has occurred.'
    end
  end

  def picture_params
    params.require(:picture).permit(:description, :image)
  end
end
