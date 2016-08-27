class LikesController < ApplicationController
  def create
    @picture = Picture.find(params[:id])
    @picture.likes.create
    redirect_to pictures_path
  end
end
