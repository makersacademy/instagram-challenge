class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:show, :index]

  def index
    @pictures = Picture.all
  end

  def new
  end

  def create
    @picture = Picture.new(picture_parameters)
    @picture.user_id = current_user.id
    @picture.save
    redirect_to pictures_path
  end

  def destroy
    Picture.find(params[:id]).destroy
    redirect_to pictures_path
  end

  def picture_parameters
    params.require(:picture).permit(:title, :description, :photo)
  end

end
