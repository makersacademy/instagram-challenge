class LikesController < ApplicationController

  def create
    user = current_user
    @image = user.images.find(params[:image_id])
    @image.likes.create
    render json: {new_like_count: @image.likes.count}
  end

end
