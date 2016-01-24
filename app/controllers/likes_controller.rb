class LikesController < ApplicationController

  def create
    @picture = Picture.find(params[:id])
    @picture.endorsements.create
    redirect pictures_path
  end
end
