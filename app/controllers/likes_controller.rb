class LikesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def create
    @picture = Picture.find(params[:picture_id])
    @like = @picture.likes.new(user_id: current_user.id)
    @like.save
    redirect_to pictures_path
  end

  def destroy
    @picture = Picture.find(params[:picture_id])
    @picture.likes.find_by(user_id: current_user.id).destroy
    redirect_to pictures_path
  end

  def like_params
    params.require(:like).permit(:user_id)
  end
end
