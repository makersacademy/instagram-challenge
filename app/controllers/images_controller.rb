class ImagesController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    Image.create image_params
    redirect_to images_path
  end

  def image_params
    params.require(:image).permit :title
  end
end
