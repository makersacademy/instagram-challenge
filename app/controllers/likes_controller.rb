class LikesController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @picture.likes.create
    redirect_to picture_path(params[:picture_id])
  end

end
