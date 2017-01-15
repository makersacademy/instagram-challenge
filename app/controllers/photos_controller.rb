class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    user = current_user
    @photo = user.photos.create(photos_params)
    redirect_to '/photos'
  end

  def show
    @photo = Photo.find(params[:id])
    @comments = @photo.comments.all
    @new_comment = Comment.new
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "Photo deleted successfully"
    redirect_to '/photos'
  end

  private

  def photos_params
    params.require(:photo).permit(:image)
  end

end
