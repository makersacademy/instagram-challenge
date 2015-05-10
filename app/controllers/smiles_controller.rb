class SmilesController < ApplicationController
  def create
    smile = Smile.where(user_id: current_user.id, photo_id: params[:photo_id]).first
    if smile
      smile.destroy
    else
      Smile.create(
        user_id: current_user.id,
        photo_id: params[:photo_id])
    end
    redirect_to '/photos'
  end
end
