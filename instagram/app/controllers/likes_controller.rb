class LikesController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    @like = Like.new
    redirect_to pictures_path
  end


end
