class LikesController < ApplicationController
  def create
    @image = Image.find(params[:image_id])
    @image.likes.create
    render json: {new_like_count: @image.likes.count}
  end
end
