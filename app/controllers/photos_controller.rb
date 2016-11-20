class PhotosController < ApplicationController

  before_action do
    @currentUser = current_user.id
  end

  def new
    if !user_signed_in?
      redirect_to '/feeds'
    end
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    @photo.save
    flash[]
    redirect_to '/feeds'
  end

  def update
  end

  def edit
  end


  private
  def photo_params
    params.require(:photo).permit(:name, :image)
  end

end
