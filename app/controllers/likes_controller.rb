class LikesController < ApplicationController

  before_action :authenticate_user!

  def new
    create
  end

  def create
    photo = Photo.find(params[:photo_id])
    like = photo.new_like(current_user)
    
    if like == false
      flash.keep[:notice] = 'You have already liked this photo'
    end
    redirect_to "/photos/#{photo.id}"
  end

end
