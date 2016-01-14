class LikesController < ApplicationController
  def create
    filterspam = Filterspam.find(params[:filterspam_id])
    filterspam.likes.create(user_id: current_user.id)
    redirect_to '/'
  end
end
