class LikesController < ApplicationController

  def create
    @image = Image.find(params[:image_id])
    @image.likes.create.set_user!(current_user)
    redirect_to "/images/#{@image.id}"
  end

end
