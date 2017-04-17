class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index 
    @user = current_user
    @pictures = @user.pictures.all
  end 

  def new
    @picture = Picture.new
  end 

  def create
    @user = current_user
    @picture = @user.pictures.new(picture_params)
    if @picture.save
      redirect_to pictures_path
    else
      render 'new'
    end
  end

  def picture_params
    params.require(:picture).permit(:name, :image)
  end

  
end
