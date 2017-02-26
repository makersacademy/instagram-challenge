class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @pictures = Picture.new
  end

  def create
    Picture.create(picture_params)
    redirect_to '/pictures'
  end

  def update
    @user = current_user
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)
    redirect_to '/pictures'
  end

  def edit
    @picture = Picture.find(params[:id])
  end


  private

  def picture_params
    params.require(:picture).permit([:description, :image, :pineapples])
  end

end
