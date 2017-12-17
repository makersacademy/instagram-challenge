class LikesController < ApplicationController
  def create
    current_user.likes.create(clicked: params[:like], image_id: params[:image_id])
    redirect_to '/'
  end
end
