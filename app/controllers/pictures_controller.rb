class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    Picture.create(picture_params)
    redirect_to pictures_path, notice: 'successfully created'
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
    @picture.destroy
    redirect_to pictures_path, notice: 'successfully deleted'
  end

  private

  def picture_params
    params.require(:picture).permit(:description, :picture)
  end

  def update_params
    params.require(:picture).permit(:description)
  end
end
