class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
    @pictures = Picture.all.order('created_at DESC')
  end

  def create
    p params
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    @picture.save
    redirect_to pictures_path
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_path
  end

  private
  def picture_params
    params.require(:picture).permit(:image, :caption)
  end
end
