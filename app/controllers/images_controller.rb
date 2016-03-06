class ImagesController < ApplicationController
  
  before_action :authenticate_user! 
  
  def index
    @images = Image.all
  end
  
  def new
     @image = Image.new
  end
  
  def create
    @user = User.find(current_user.id)
    @image = @user.images.create(image_params)
    redirect_to images_path
  end
  
  def image_params
    params.require(:image).permit(:title, :image, :user_id)
  end
  
end
