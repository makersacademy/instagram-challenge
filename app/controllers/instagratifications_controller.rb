class InstagratificationsController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    @instagratification = @picture.instagratifications.new
    @instagratification.user = current_user
    @instagratification.save
    redirect_to "/pictures/#{params[:picture_id]}?id=#{params[:picture_id]}"
  end

end
