class ImagesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]
  # permit(:title, :description, :picture)

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = current_user.images.build(image_params)
    if @image.save
      redirect_to images_path
    else
      render 'new'
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:picture, :name)
  end
end
