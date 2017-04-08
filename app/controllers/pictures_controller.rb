class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(picture_params)
    if @picture.save
      flash[:success] = "Picture successfully added"
      redirect_to pictures_path
    else
      redirect_to pictures_path
    end
  end


  private

  # can use this to only permit certain parameters

  def picture_params
    params.require(:picture).permit(:location, :image)
  end
end
