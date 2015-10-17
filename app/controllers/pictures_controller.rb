class PicturesController < ApplicationController
  before_action :authenticate_user!, except: :index
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
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(update_params)
    redirect_to pictures_path, notice: 'successfully updated'
  end

  def destroy
    @picture = Picture.find(params[:id])
    if @picture.user == current_user
      @picture.destroy
      redirect_to pictures_path, notice: 'successfully deleted'
    else
      redirect_to pictures_path
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:description, :picture)
  end

  def update_params
    params.require(:picture).permit(:description)
  end
end
