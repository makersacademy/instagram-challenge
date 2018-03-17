class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    user = User.find(session["warden.user.user.key"][0][0])
    parametry = photo_params
    parametry[:user_id] = user.id
    @photo = Photo.new(parametry)
    if @photo.save
      flash[:notice] = "Thank you #{user.username} for adding a photo"
      user.photos << @photo
      redirect_to '/photos'
    else
      flash[:notice] = "Please add the description"
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:description)
  end

end
