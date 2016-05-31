class LikesController < ApplicationController
  def create
    @picture = Picture.find(params[:picture_id])
    @like = @picture.likes.create
    @like.user = current_user
    @like.save
    redirect_to '/pictures'
  end
end
