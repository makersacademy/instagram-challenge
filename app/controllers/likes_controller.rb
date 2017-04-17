class LikesController < ApplicationController

  def create
    @image = Image.find(params[:review_id])
    @image.likes.create
    redirect_to images_path
  end

end
