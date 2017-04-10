class PicturesController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    @picture.save
    flash[:notice] = "Image uploaded successfully."
    p @picture.id
    redirect_to pictures_path
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def destroy
    @picture = Picture.find(params[:id])
    if @picture.user_id == current_user.id
      @picture.destroy
      flash[:notice] = "Image successfully deleted."
    else
      flash[:notice] = "You are not authorised to delete this."
    end
    redirect_to pictures_path
  end

  private

  def picture_params
    params.require(:picture).permit(:image)
  end
end
