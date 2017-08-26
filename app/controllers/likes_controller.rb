class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @photo = Photo.find(params[:photo_id])
    @like = @photo.likes.create(user_id: current_user.id)
    redirect_to photo_path(@photo)
  end
end
