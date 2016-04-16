class ImagesController < ApplicationController

  before_action :authenticate_user!, :except => [:index]
  
  def index
    @images = Image.all
  end

  def show
    p params
    user = User.find(params[:id])
    image = Image.all
    @images = user.images
  end

  def new
  end

  def create
    image = Image.new(restaurant_params)
    image.user_id = current_user.id
    image.save
    redirect_to ('/images')
  end

  def restaurant_params
    params.require(:image).permit(:name, :description, :image)
  end
end
