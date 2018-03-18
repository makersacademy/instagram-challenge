class HeartsController < ApplicationController

  def create
    image = Image.find(params[:image_id])
    @heart = image.hearts.new
    @heart.save
    redirect_to image
  end

end
