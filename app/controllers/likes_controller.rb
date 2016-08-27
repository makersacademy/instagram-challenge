class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.likes.create(user: current_user)
    redirect_to photo_path(@photo)
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

end
