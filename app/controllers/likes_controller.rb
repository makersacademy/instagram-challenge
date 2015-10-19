class LikesController < ApplicationController
  def create
    if current_user
      @image = Image.find(params[:image_id])
      @image.likes.create
      redirect_to images_path
    else
      redirect_to new_user_session_path
    end
  end
end
