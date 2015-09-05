class PhotosController < ApplicationController

	# before_action :authenticate_user!, :except => [:index, :show]

	def index
		@photos = Photo.all
	end

	def show
  	@photo = Photo.find(params[:id])
	end

	def new
		@photo = Photo.new
	end

	def create
		Photo.create(photo_params)
		redirect_to '/photos'
	end

	def destroy
		@photo = Photo.find(params[:id])
		@photo.destroy
		flash[:notice] = "Photo deleted successfully"
		redirect_to "/photos"
	end



  #utility method
  def photo_params
  	params.require(:photo).permit(:description, :picture)
  end

end
