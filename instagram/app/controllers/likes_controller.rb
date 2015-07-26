class LikesController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @like = Like.new
  end


end
