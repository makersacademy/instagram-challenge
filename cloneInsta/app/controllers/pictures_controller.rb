class PicturesController < ApplicationController
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
      params.require(:picture).permit(:url, :comment)
    end
end
