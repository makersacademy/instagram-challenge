class PicturesController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    p params
    p current_user
    @picture = current_user.pictures.new(picture_params)
    p @picture
    @picture.save ? redirect_to(@picture) : render('new')
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    redirect_to pictures_path
  end

  private

  def picture_params
    params.require(:picture).permit(:url)
  end

end
