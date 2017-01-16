class LikesController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    @like = @photo.likes.new(user_id: current_user.id)
    @like.save
    redirect_to photos_path
  end
end
