class ImagesController < ApplicationController

  def index
    # @images = Image.all
    @images = Image.all.paginate(:page => params[:page], :per_page => 9)
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.save
    redirect_to @image
  end

  def show
    @image = Image.find params[:id]
  end

  private

  def image_params
    params.require(:image).permit(:user, :caption, :image)
  end

end
