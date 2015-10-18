class PicturesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :find_picture, only: [:edit, :update, :destroy]
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      redirect_to pictures_path, notice: 'successfully created'
    else
      flash.now[:alert] = 'You need to attach a picture'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @picture.user == current_user
      @picture.update(update_params)
      redirect_to pictures_path, notice: 'successfully updated'
    else
      redirect_to pictures_path, alert: 'You cannot edit other users\' post'
    end
  end

  def destroy
    if @picture.user == current_user
      @picture.destroy
      redirect_to pictures_path, notice: 'successfully deleted'
    else
      redirect_to pictures_path
    end
  end

  private

  def find_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:description, :picture)
  end

  def update_params
    params.require(:picture).permit(:description)
  end
end
