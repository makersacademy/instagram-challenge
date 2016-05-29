class LikesController < ApplicationController

  def create
    image = Image.find(params[:image_id])
    image.likes.create_with_user(current_user)
    redirect_to images_path
  end

end
