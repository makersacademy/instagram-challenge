class PicturesController < ApplicationController

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    @picture.save
    redirect_to root_path
  end

  def picture_params
    params.require(:picture).permit(:image,:tag)
  end

end
