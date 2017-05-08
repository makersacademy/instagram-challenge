class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    picture = Picture.find(params[:picture_id])
    unless current_user.has_liked?(picture) || current_user == picture.user
      like = picture.build_like(current_user)
      like.save
      redirect_to pictures_path
    end
  end

  def index
    @picture = Picture.find(params[:picture_id])
  end

end
