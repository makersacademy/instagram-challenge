class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]


  def new
    @photo = Photo.new
  end

  def build_with_user(attributes = {}, user)
  attributes[:user] ||= user
  build(attributes)
  end

  def create
    @photo = current_user.photos.new(photo_params)
      if @photo.save
        flash[:success] = "your photo as been added to Pinstagram"
          redirect_to @photo
      else
        flash[:alert] = "You must a an image to create a photo"
        render :new
      end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:title, :image)
  end

  def upvote
    @photo = Photo.find(params[:id])
    @photo.liked_by current_user
    redirect_to @photo
  end

  def downvote
    @photo = Photo.find(params[:id])
    @photo.unliked_by current_user
    redirect_to @photo
  end

end
