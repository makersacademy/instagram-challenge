class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def show
    @user = User.find(params[:user_id])
    @picture = Picture.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @picture = @user.pictures.build
  end

  def create
    @user = User.find(params[:user_id])
    @picture = Picture.new(picture_params)
    @picture.user = @user
    if @picture.save
      redirect_to user_picture_url(@user, @picture)
    else
      render 'new'
    end
  end

  private
  def picture_params
    params.require(:picture).permit(:description, :photo, :user_id, :id)
  end
end
