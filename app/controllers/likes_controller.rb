class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    picture = Picture.find(params[:picture_id])
    like = picture.likes.new
    like.user = current_user
    like.save
    redirect_to pictures_path
  end

end
