class LikesController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    full_params = like_params
    full_params[:user_id] = current_user.id
    @like = @picture.likes.new(full_params)
    @like.save
    redirect_to picture_path(@picture)
  end

  def new
  end

  private

  def like_params
    params.permit(:user_id)
  end
end
