class InstagratificationsController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    @instagratification = @picture.instagratifications.new
    @instagratification.user = current_user
    @instagratification.save
    redirect_to "/pictures/#{params[:picture_id]}?id=#{params[:picture_id]}"
  end

  def destroy
    @instagratification = Instagratification.find(params[:id])
    unless @instagratification.belongs_to?(current_user)
      flash[:alert] = "Naughty! You can only delete your own ♥s!"
      redirect_to "/pictures"
    end
    @instagratification.destroy
    redirect_to "/pictures/#{params[:picture_id]}?id=#{params[:picture_id]}"
  end

end
