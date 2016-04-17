class ImagesController < ApplicationController

  before_action :authenticate_user!, :except => [:index]
  
  def index
    @images = Image.all
  end

  def new
  end

  def create
    image = Image.new(restaurant_params)
    image.user_id = current_user.id
    image.save
    redirect_to ('/images')
  end

  def show
    user = User.find(params[:id])
    image = Image.all
    @images = user.images
  end

  def destroy
    image = Image.find(params[:id])
    image.destroy 
    flash[:notice] = 'Image was removed'
    redirect_to('/')
  end

  def restaurant_params
    params.require(:image).permit(:name, :description, :image)
  end
end
