class PicturesController < ApplicationController

	before_action :authenticate_user!, :except => [:index]

	def index
		@pictures = Picture.all
	end

	def new 
		@picture = Picture.new
	end

	def create
		@picture = Picture.create_with_user(picture_params, current_user)
		@picture.save ? redirect_to(pictures_path) : render(:new)
	end

	private

	def picture_params
		params.require(:picture).permit(:caption, :image)
	end

end
