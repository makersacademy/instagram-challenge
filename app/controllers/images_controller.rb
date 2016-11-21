class ImagesController < ApplicationController
  def index
    @image = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.create(image_params)
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


private

def image_params
  params.require(:image).permit(:url)
end

end
