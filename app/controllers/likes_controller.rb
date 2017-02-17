class LikesController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    @like = @photo.likes.new(user_id: current_user.id)
    @like.save
    render json: { new_like_count: @photo.likes.count }
  end
end
