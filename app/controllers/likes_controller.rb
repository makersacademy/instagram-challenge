class LikesController < ApplicationController
  before_action :authenticate_user!

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

  def destroy
    @picture = Picture.find(params[:picture_id])
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to picture_path(@picture)
  end

  private

  def like_params
    params.permit(:user_id)
  end
end
