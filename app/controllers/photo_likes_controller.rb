class PhotoLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    photo = Photo.find(params[:photo_id])
    photo_like = photo.photo_likes.build(user: current_user)
    flash[:notice] = 'User can only like a photo once.' unless photo_like.save
    redirect_to photos_path
  end
end
