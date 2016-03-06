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
      redirect_to '/images'
    else
      render 'new'
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def destroy
    @image = Image.find(params[:id])
    name = @image.name
    @image.destroy
    flash[:notice] = "Image '#{name}' deleted successfully"
    redirect_to '/images'
  end

  def image_params
    params.require(:image).permit(:name, :description, :image)
  end
end
