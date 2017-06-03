class ImagesController < ApplicationController

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id
    @image.save
    redict_to root_path
  end

  private

  def image_params
    params.require(:image).permit(:image)
  end
end
