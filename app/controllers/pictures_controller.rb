class PicturesController < ApplicationController
  
  before_action :authenticate_user!

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

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = 'Picture deleted successfully'
    redirect_to '/pictures'
  end

  def post_params
    params.require(:picture).permit(:content, :image)
  end 

end
