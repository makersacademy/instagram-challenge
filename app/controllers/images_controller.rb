class ImagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @images = Image.all.reverse
  end

  # def show
  #   @image = Image.find(params[:id])
  # end

  def new
    @image = current_user.images.new
  end

  def create
    @image = current_user.images.create(image_params)
    redirect_to images_url
  end

  private

  def image_params
    params.require(:image).permit(:caption, :photo)
  end
end
