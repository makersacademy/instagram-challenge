class LikesController < ApplicationController

  def index
    @likes = Like.all
    redirect_to '/photos'
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.likes.create
    redirect_to '/photos'
  end

end
