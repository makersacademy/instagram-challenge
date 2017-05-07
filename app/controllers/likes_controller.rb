class LikesController < ApplicationController

  def new
    picture = Picture.find(params[:picture_id])
    picture.likes.create
    redirect_to pictures_path
  end

end
