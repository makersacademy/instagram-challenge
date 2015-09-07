class LikesController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    @like = @photo.likes.build_with_user(current_user)
    @like.save
    redirect_to photo_path(@photo)
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
    @like = @photo.likes.find_by(user_id: current_user.id).destroy
    redirect_to photo_path(@photo)
  end
end
