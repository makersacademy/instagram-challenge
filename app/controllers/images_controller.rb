class ImagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @images = Image.all.reverse
  end

  def new
    @image = current_user.images.new
  end

  def create
    @image = current_user.images.create(image_params)
    redirect_to images_url
  end

  def edit
    @image = current_user.images.find(params[:id])
  end

  def update
    @image = current_user.images.find(params[:id])

    @image.update(image_params)
    flash[:notice] = 'Your caption has been updated'
    redirect_to images_url
  end

  private

  def image_params
    params.require(:image).permit(:caption, :photo)
  end

end
