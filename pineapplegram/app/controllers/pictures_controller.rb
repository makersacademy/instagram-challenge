class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @users = User.all
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @user = current_user
    @pictures = Picture.new
  end

  def create
    @user = current_user
    @picture = @user.pictures.create(picture_params)
    redirect_to '/pictures'
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)
    redirect_to '/pictures'
  end

  def edit
    @users = User.all
    @picture = Picture.find(params[:id])
  end


  private

  def picture_params
    params.require(:picture).permit([:description, :image, :pineapples, :user_id])
  end

end
