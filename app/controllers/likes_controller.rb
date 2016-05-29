class LikesController < ApplicationController

  def create
    @image = Image.find(params[:image_id])
    @image.likes.create
    redirect_to images_path
  end

end
