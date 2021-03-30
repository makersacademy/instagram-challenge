class ImagesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    user = current_user
    @image = user.images.new(image_params)
    if @image.save
      redirect_to images_path
    else
      render 'new'
    end
  end

  def destroy
    user = current_user
    @image = user.images.find(params[:id])
    @image.image = nil
    @image.save
    @image.destroy
    redirect_to '/'
  end

  def show
    @image = Image.find(params[:id])
  end

  private

  def image_params
    params.require(:image).permit(:title,:image)
  end

end
