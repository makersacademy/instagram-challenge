class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @user = current_user
    @photos = Photo.all
    @reaction = Reaction.new
    @photo = Photo.new
    render 'index'
  end

  def new
    @photo = Photo.new
  end

  def create
    @user = current_user
    @photo = @user.photos.create(photo_params)
    redirect_to '/photos'
  end

  def edit
  @photo = Photo.find(params[:id])
  end

  def update
  @photo = Photo.find(params[:id])
  @photo.update(photo_params)
  redirect_to '/photos'
end

  def destroy
  @photo = Photo.find(params[:id])
  @photo.destroy
  redirect_to '/photos'
end

  private

  def photo_params
    params.require(:photo).permit(:image, :caption)
  end

end
