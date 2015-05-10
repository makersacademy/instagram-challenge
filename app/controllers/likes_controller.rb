class LikesController < ApplicationController
  def create
    Photo.find(params["photo_id"]).likes.create({ user_id: current_user.id })
    redirect_to('/photos')
  end
  def destroy
    Like.destroy(params[:id])
    redirect_to('/photos')
  end
end
