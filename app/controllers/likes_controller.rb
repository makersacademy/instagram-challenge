class LikesController < ApplicationController
  def create
    @photo = Photo.find(params[:photo_id])
    @photo.likes.create_with_user current_user
    redirect_to photos_path
  end

  # def like_params
  #   params.require(:like).permit(:user)
  #
  # end

end
