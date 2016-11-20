class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    Image.create(image_params)
    redirect_to images_path
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

    redirect_to image_path(@image)
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = 'Image deleted successfully'
    redirect_to images_path
  end

  private

  def image_params
    params.require(:image).permit(:description, :url)
  end
end
