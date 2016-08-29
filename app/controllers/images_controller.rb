class ImagesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = current_user.images.new(image_params)
    @image.save
    redirect_to '/images'
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
    flash[:notice] = 'Image has been deleted'
    redirect_to '/images'
  end

  private

  def image_params
    params.require(:image).permit(:name, :description, :image)
  end

end
