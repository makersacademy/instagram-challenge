class LikesController < ApplicationController

  def create
    @image = Image.find(params[:image_id])
    @image.likes.create_with_user(current_user)
    render json: {new_like_count: @image.likes.count}
  end

end
