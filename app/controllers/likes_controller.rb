class LikesController < ApplicationController

  before_action :authenticate_user!


  def create
    @photo = Photo.find(params[:photo_id])
    @photo.likes.create(user: current_user)
    render json: {new_likes_count: @photo.likes.count}
  end

  def like_params
    params.require(:like).permit(:like).merge(user: current_user)
  end


end
