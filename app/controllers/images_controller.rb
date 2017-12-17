class ImagesController < ApplicationController
  def new

  end

  def create
    current_user.images.create(image_params)
    p "LOOOOOOOOOOK HERE"
    p params[:avatar]
    redirect_to '/'
  end

  private

  def image_params
    params.require(:image).permit(:name, :url, :avatar)
  end

end
