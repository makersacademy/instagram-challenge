class PicturesController < ApplicationController
  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(picture_params)
    redirect_to '/profiles#index'
  end

  private

  def picture_params
    params.require(:picture).permit(:image, :caption)
  end
end
