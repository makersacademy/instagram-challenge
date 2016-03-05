class PhotosController < ApplicationController
	def index
	@photo = Photo.all
	end

	def new
	@photo = Photo.new
	end

	def create
	@photo = Photo.new(params[:file])
	redirect_to '/'
	end	

private



end