class EndorsementsController < ApplicationController

  def new
    create
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.endorsements.create
    redirect_to root_path
  end
end
