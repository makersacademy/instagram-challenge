class PhotoController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    user_signed_in? ? (@photo = Photo.new) : (redirect_to action:"index")
  end

  def create
    @user = User.find(current_user.id)
    @photo = @user.photos.create(photo_params)
    redirect_to action:"index"
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def photo_params
    params[:photo].permit(:description, :image)
  end

end
