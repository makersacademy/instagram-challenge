class ImagesController < ApplicationController

  # before_action :authenticate_user!, except: [:index, :show]
  # before_action :set_current_user, only: :destroy

  def index
    @images = Image.all
  end

  def new
  end

  def create
    Image.create(image_params)
    redirect_to images_path
  end

  def image_params
    params.require(:image).permit(:description, :picture)
  end

end
