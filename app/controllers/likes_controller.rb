class LikesController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    @like = @photo.likes.create(like_params)
    redirect_to photo_path(@photo)
  end

  private
    def like_params
      params.require(:like).permit(:liker)
    end
end
