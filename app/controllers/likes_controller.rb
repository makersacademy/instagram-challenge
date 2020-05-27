class LikesController < ApplicationController
  before_action :set_picture
  before_action :set_like, only: [:destroy]

  def create
    @picture.likes.create(user_id: current_user.id)
    redirect_to pictures_path
  end

  def destroy
    @like.destroy
    redirect_to pictures_path
  end

  private

  def set_picture
    @picture = Picture.find(params[:picture_id])
  end

  def set_like
    @like = @picture.likes.find(params[:id])
  end

end
