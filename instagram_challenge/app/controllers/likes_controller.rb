class LikesController < ApplicationController
  def create
    @photo = Photo.find(params[:comment_id])
    @photo.likes.create
    render json: {new_likes_count: @photo.likes.count}
  end

end
