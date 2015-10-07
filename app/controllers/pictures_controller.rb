class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @pictures = Picture.all
  end

  def new
    @user = User.find(current_user.id)
    @picture = Picture.new
  end

  def create
    @user = User.find(current_user.id)
    @picture = @user.pictures.create(picture_params)
    if @picture.save
      redirect_to pictures_path
    else
      render 'new'
    end
  end

  def edit
    @picture = Picture.find(params[:id])

    unless current_user.id == @picture.user_id
      redirect_to pictures_path
    end
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)
    redirect_to pictures_path
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = 'Image successfully deleted'
    redirect_to pictures_path
  end

  def picture_params
    params.require(:picture).permit(:caption, :image)
  end
end
