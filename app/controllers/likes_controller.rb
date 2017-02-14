class LikesController < ApplicationController

  def index
    @likes = Like.all
    redirect_to pictures_path
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.likes.create
    render json: {new_like_count: @picture.likes.count}
  end
end
