class PicturesController < ApplicationController
  def index
    @pictures = Picture.all  
  end  

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(post_params)
    redirect_to '/pictures'
  end 

  def show
    @picture = Restaurant.find(post_params)
  end

  def post_params
    params.require(:picture).permit(:content, :image)
  end 

end
