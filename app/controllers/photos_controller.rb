class PhotosController < ApplicationController
	before_action :authenticate_user!, :except => [:index, :show]

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

	def show
		@photo = Photo.find(params[:id])
	end

	def edit
		@photo = Photo.find(params[:id])
	end

	def update 
		@photo = Photo.find(params[:id])
		@photo.update(description_params)
		if @photo.save
		render 'show'
		else
		render 'edit'
		end
	end

	private

	def description_params
		params.require(:photo).permit(:description)
	end

	def photo_params
    params.require(:photo).permit(:image, :description)   # plus whatever other user attributes you have
  end

end