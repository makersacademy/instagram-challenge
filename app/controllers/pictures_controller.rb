class PicturesController < ApplicationController
skip_before_action :verify_authenticity_token
before_action :authenticate_user!, except:[:index] 
  def index
    @pictures = Picture.all
  end

  def new
    @picture = current_user.pictures.build
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
    @picture = Picture.find(params[:id])
    @comments = @picture.comments
  end

  private

  def picture_params
    params.require(:picture).permit(:description, :image)
  end

end
