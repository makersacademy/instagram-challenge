class PicturesController < ApplicationController
  def index
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(pic_params)
  end

  private

  def pic_params
    params.require(:pictures).permit(:title, :description)
  end
end
