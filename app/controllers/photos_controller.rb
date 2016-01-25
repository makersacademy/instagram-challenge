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

  def destroy
    photo = Photo.find(params[:id])
    if photo.posted_by?(current_user)
      photo.destroy
      flash[:success] = 'Photo deleted successfully'
    else
      flash[:error] = 'Only the owner can delete a photo'
    end
    redirect_to photos_path
  end

  private

  def photo_params
    new_params = params.require(:photo).permit(:image)
    new_params[:user_id] = current_user.id
    new_params
  end
end
