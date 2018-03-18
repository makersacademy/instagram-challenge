class PhotosController < ApplicationController

  def index
    if session["warden.user.user.key"] != nil
      @current_user = User.find(session["warden.user.user.key"][0][0])
    else
      @current_user = nil
    end
    @photos = Photo.all
    @like = Like.new
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
    params.require(:photo).permit(:description, :image)
  end

end
