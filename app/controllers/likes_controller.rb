class LikesController < ApplicationController

  def index
    @likes = Like.all
    redirect_to '/photos'
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.likes.create
    render json: {new_like_count: @photo.likes.count}
  end

end
