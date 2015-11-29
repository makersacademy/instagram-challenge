class LikesController < ApplicationController
  def create
    @filterspam = Filterspam.find(params[:filterspam_id])
    @filterspam.likes.create
    redirect_to '/'
  end
end
