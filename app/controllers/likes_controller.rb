class LikesController < ApplicationController

  def create
    @image = Image.find(params[:image_id])
    @image.likes.create_with_user(current_user)
    likes_count = @image.likes.count
    render json: { new_likes_count: likes_count, image_id: @image.id }
  end

end
