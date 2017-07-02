class PicturesController < ApplicationController

  def show
    @pictures = Picture.all
    render :index
  end

  def new
    @picture = Picture.new
    render :new
  end

  def create
    Picture.create(picture_params).save
    redirect_to action: "show"
  end

  private

  def picture_params
    params.require(:picture).permit(:description, :image)
  end

end
