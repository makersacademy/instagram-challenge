class LikesController < ApplicationController

  def create
    @image = Image.find(params[:image_id])
    @image.likes.create
    # redirect_to image_path(params[:image_id])
    redirect_to '/'
  end

end
