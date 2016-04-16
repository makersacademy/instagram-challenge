class ImagesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]
  
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

  def restaurant_params
    params.require(:image).permit(:name, :description, :image)
  end
end
