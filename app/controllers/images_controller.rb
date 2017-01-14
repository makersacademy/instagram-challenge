class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to images_path
    else
      render 'new'
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.image = nil
    @image.save
    @image.destroy
    redirect_to '/'
  end

  private

  def image_params
    params.require(:image).permit(:title,:image)
  end

end
