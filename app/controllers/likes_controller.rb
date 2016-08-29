class LikesController < ApplicationController

  def index
    @image = Image.find(params[:image_id])
    @image.likes.create
    redirect_to '/'
  end
end
