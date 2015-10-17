class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)

    @picture.save
    redirect_to pictures_path
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)
    flash[:notice] = "You have successfully updated the picture"
    redirect_to picture_path(@picture)
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = "You have successfully deleted the picture"
    redirect_to pictures_path
  end

  private

  def picture_params
    params.require(:picture).permit(:name, :description)
  end

end
