class PicturesController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @pictures = Picture.all  
    @user = current_user
  end  

  def show
    @picture = Picture.find(params[:id])
   end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(post_params)
    @picture.user_id = current_user.id
    @picture.save
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
