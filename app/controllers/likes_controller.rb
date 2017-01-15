class LikesController < ApplicationController

  def new
    @photo = Photo.find(params[:photo_id])
    @like = Like.new
    create
  end

  def create
    photo = Photo.find(params[:photo_id])
    like = photo.likes.new()
    like.user = current_user
    like.save
    redirect_to photo_path(photo)
  end

end
