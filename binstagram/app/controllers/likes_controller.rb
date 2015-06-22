class LikesController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    @like = @photo.likes.build(user: current_user)
    @like.save
    render json: {new_like_count: @photo.likes.count}
  end
end
