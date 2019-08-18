class LikesController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    @like = @photo.likes.create
    @like.user_id = current_user.id
    @like.save!
    redirect_to photo_path(@photo)
  end

  # private
  #   def like_params
  #     params.require(:like).permit(@user.id)
  #   end
end
