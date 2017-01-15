class LikesController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    @like = @picture.likes.create
    redirect_to root_path
  end

end
