class LikesController < ApplicationController
  def create
    @image = Image.find(params[:image_id])
    if !current_user.has_liked? @image
      @image.likes.create
    end
    render json: {new_like_count: @image.likes.count}
  end
end
