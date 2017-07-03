class PicturesController < ApplicationController

  before_action :require_login

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
    render :new
  end

  def create
    Picture.create(picture_params).save
    redirect_to action: "show"
  end

  private

  def picture_params
    params.require(:picture).permit(:description, :image)
  end

end
