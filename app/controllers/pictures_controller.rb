class PicturesController < ApplicationController

  def index
    @user = current_user
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    user = current_user if current_user
    if user
      @picture = user.pictures.create(picture_params)
      redirect_to pictures_path
    else
      redirect_to new_user_session_path
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:image, :description)
  end

end
