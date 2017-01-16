class LikesController < ApplicationController

  def create
    user = current_user
    @image = Image.find(params[:image_id])
    @image.likes.create!(user_id: user.id)
    render json: {new_like_count: @image.likes.count}
  end

end
