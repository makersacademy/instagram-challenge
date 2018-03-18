class PicturesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @pictures = Picture.all
  end

  def new
    p params
  end

  def show
    @user = User.find(params[:id])
    @picture = @user.pictures.find(params[:id])
  end

  def create
    p params
    @user = User.find(params[:user_id])
    @picture = @user.pictures.create(picture_params)
    @picture.save

    redirect_to user_picture_path(@user)
  end

  private
    def picture_params
      params.require(:picture).permit(:image, :description)
    end


end
