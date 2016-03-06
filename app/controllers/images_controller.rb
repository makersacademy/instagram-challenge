class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def new
  end

  def create
    @image = Image.create(image_params)
    if @image.save
      redirect_to images_path
    else
      render 'new'
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
    puts @image
    @image.destroy
    puts @image
    flash[:notice] = 'Image deleted successfully'
    redirect_to '/images'
  end

  def image_params
    params.require(:image).permit(:title, :image, :description)
  end

end
