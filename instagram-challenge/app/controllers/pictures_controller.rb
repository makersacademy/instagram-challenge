require 'rmagick'
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

  def destroy
	 picture = Picture.find(params[:id])
   comment = Comment.all
		if picture.user == current_user
			picture.destroy
			flash[:notice] = "Image has been deleted"
			redirect_to('/')
		else
			flash[:notice] = "You do not have permission to delete this Image"
			redirect_to ('/')
		end
	end

  private

  def picture_params
   params.require(:picture).permit(:caption, :image, :sepia_box)
  end


end
