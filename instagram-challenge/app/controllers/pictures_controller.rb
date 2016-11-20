class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  def show
   @picture = Picture.find(params[:id])
  end

  def new
    @add_picture = Picture.new
  end

  def create
    if !user_signed_in?
      redirect_to('/users/sign_in')
    else
      @add_picture = Picture.new(picture_params)
      @add_picture.user = current_user
      if @add_picture.save
        redirect_to('/')
      else
        flash[:notice] = 'There was a problem adding your picture'
        redirect_to('/')
      end
    end
  end

  private

  def picture_params
   params.require(:picture).permit(:caption, :image)
  end


end
