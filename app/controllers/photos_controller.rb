class PhotosController < ApplicationController

  before_action do
    @currentUser = current_user.id
  end

  def new
    if !user_signed_in?
      redirect_to '/feeds'
    end
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    @photo.save
    flash[:notice] = "Post successfully created"
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
