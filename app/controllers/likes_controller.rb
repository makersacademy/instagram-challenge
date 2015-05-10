class LikesController < ApplicationController

  def new
  end

  def create
    @image = Image.find(params[:image_id])
    @like = @image.likes.new
    @like.user_id = current_user.id
    @like.save
    redirect_to images_path
  end
end
