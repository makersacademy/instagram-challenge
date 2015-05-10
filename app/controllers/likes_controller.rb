class LikesController < ApplicationController

  def create
    @image = Image.find(params[:image_id])

    # @image.likes.create

    @like = @image.likes.create
    @like.user_id = current_user.id
    @like.save

    redirect_to images_path
  end
end
