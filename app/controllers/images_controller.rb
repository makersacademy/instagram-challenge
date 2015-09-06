class ImagesController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  def index
    @images = Image.all
  end

  def new
  end

  def create
    Image.create(image_params)
    redirect_to '/images'
  end

  def image_params
    params.require(:image).permit(:upload, :caption)
  end
end
