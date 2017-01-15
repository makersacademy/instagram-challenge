class LikesController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    @like = @photo.likes.new
    @like.user_id = current_user.id
    @like.save
    redirect_to "/photos/#{@photo.id}"
  end

end
