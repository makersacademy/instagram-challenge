class PhotosController < ApplicationController
	def index
	@photo = Photo.all
	end

	def new
	@photo = Photo.new
	end

	def create
	@photo = Photo.new(photo_params)
	if @photo.save
		flash[:success] = "the photo was added!"
	redirect_to '/'
	end	
	end

private

 def photo_params
    params.require(:photo).permit(:image)   # plus whatever other user attributes you have
  end

end