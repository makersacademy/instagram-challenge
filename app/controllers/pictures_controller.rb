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

  def show
    current_picture
  end

  def edit
    current_picture
  end

  def update
    update_current_picture
    redirect_to picture_path
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :image)
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

  def current_picture
    @picture = Picture.find(params[:id])
  end

  def update_current_picture
    @picture = current_picture.update(picture_params)
  end
end
