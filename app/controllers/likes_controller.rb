class LikesController < ApplicationController

  def new
    @photo = Photo.find(params[:photo_id])
    @like = Like.new
  end
end
