class LikesController < ApplicationController
  def create
    @picture = Picture.find(params[:picture_id])
    @like = @picture.likes.create
    redirect_to pictures_path
  end

  # def like_params
  #   params.require(:picture).permit(:uid)
  # end
end
