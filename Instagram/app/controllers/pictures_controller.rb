class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
  end
  def create
  @picture = Picture.new(picture_params)

  @picture.save
  redirect_to @picture
  end

  private
    def picture_params
      params.require(:picture).permit(:name_of_picture, :description_of_picture)
    end

end
