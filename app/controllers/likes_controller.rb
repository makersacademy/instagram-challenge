class LikesController < ApplicationController

  before_action :set_picture

  def create
    @picture.likes.create(user_id: current_user.id)
    redirect_to pictures_path
  end

  private

  def set_picture
    @picture = Picture.find(params[:picture_id])
  end

end
