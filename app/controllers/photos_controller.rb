class PhotosController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

	def index
		@photos = Photo.all.sort_by { |p| p.created_at }.reverse
	end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to '/photos'
    else
      render 'new'
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end
end
