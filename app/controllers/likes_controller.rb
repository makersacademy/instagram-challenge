class LikesController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.likes.create
    redirect_to("/pictures")
  end
end
