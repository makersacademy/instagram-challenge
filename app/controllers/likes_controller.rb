class LikesController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.likes.create_with_user(current_user)
    render json: {new_like_count: @photo.likes.count}
  end
end
