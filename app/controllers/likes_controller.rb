class LikesController < ApplicationController

  before_action :authenticate_user!

  def create
    @photo = Photo.find(params[:photo_id])
    Like.create(photo: @photo, user: current_user)
    redirect_to photo_path(@photo)
  end

end
