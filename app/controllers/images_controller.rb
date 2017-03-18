class ImagesController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @images = Image.order('id DESC').all
  end

  def new
    @image = Image.new
  end

  def create
    # @image = Image.create(image_params)
    @image = Image.create(user_id: current_user.id,
                          image: image_params["image"])
    redirect_to '/images'
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = 'Image deleted successfully'
    redirect_to '/images'
  end

  private

  def image_params
    # params.permit(:image)
    params.require(:image).permit(:image)
  end
end
