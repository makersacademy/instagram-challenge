class LikesController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    @like = @picture.likes.new
    @like.user = current_user
    @like.save
    redirect_to picture_path(@picture)
  end
end
