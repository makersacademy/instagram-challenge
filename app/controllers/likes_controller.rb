class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    picture = Picture.find(params[:picture_id])
    like = picture.build_like(current_user)
    if like.save
      redirect_to pictures_path
    end
  end

  def index
    @picture = Picture.find(params[:picture_id])
  end

end
