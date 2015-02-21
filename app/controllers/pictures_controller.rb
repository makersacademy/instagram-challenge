class PicturesController < ApplicationController
  
  def index
    @pictures = Picture.all  
  end  

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(post_params)
    redirect_to '/pictures'
  end 


  def post_params
    params.require(:image).permit(:content, :image)
  end 

end
