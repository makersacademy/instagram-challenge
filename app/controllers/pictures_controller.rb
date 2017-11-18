class PicturesController < ApplicationController
  def new
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.save
    redirect_to @picture
  end

private
  def picture_params
    params.require(:picture).permit(:title, :text)
  end
end
