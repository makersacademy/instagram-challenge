class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    photo = Photo.find(params[:photo_id])
    photo.likes.create_with_user(current_user)
    redirect_to photos_path
  end
end
