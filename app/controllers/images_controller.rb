class ImagesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @images = Image.all
  end

  def show
    @image = Image.find params[:id]
  end

  def new
    @image = Image.new
  end

  def create
    current_user.images.create image_params
    redirect_to images_path
  end

  def image_params
    params.require(:image).permit :title
  end

end
