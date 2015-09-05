class LikesController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @like = Like.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.likes.create(picture_like: 1)

    redirect_to '/pictures'
  end

  def like_params
    params.require(:like).permit(:picture_like)
  end

end
