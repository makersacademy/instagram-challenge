class ImagesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @images = Image.all
  end
  def new
    @image = Image.new
  end
  def create
    @image = Image.new(image_params)
    if @image.save
      @image.user_id = current_user.id
      @image.save
      redirect_to images_path
    else
      render new
    end
  end
  def show
    @image = Image.find(params[:id])
  end
  def edit
    @image = Image.find(params[:id])
  end
  def update
    @image = Image.find(params[:id])
    @image.update(image_params)
    redirect_to '/images'
  end
  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = "Image deleted successfully"
    redirect_to '/images'
  end
  def image_params
    params.require(:image).permit(:name, :image)
  end
end
