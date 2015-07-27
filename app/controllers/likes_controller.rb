class LikesController < ApplicationController

  def new
    @image = Image.find(params[:image_id])
    @like = Like.new
  end

  def create
    @image = Image.find(params[:image_id])
    @image.likes.create
    redirect_to images_path
  end

end
