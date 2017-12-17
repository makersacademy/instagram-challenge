class PicturesController < ApplicationController
skip_before_action :verify_authenticity_token
  def index
    @pictures = Picture.all
  end

  def new
    if current_user
    @picture = current_user.pictures.build
    else
      redirect_to new_user_registration_path
    end
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      redirect_to pictures_path
    else
      render :new
    end
  end

  def show
    if current_user
    @picture = Picture.find(params[:id])
    @comments = @picture.comments
  else
    redirect_to new_user_registration_path
  end
  end

  private

  def picture_params
    params.require(:picture).permit(:description, :image)
  end

end
