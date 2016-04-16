class PicturesController < ApplicationController

  def index
    all_pictures
  end

  def new
    new_picture
  end

  def create
    create_picture
    redirect_to pictures_path
  end

  private

  def picture_params
    params.require(:picture).permit(:title)
  end

  def all_pictures
    @pictures = Picture.all
  end

  def new_picture
    @picture = Picture.new
  end

  def create_picture
    @picture = Picture.new(picture_params)
    @picture.save
  end
end
