class PicturesController < ApplicationController
  def index
  end

  # to attach an image to an existing picture:
  # picture.image.attach(params[:image])

  # to determine whether a particular picture has a image:
  # picture.image.attached?


  def display_image(picture)
    if picture.image.attached?
      picture.image
    else
      'default.png'
    end
  end


  # params.require(:picture).permit( :image)
end
