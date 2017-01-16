class LikesController < ApplicationController

  # def index
  #   picture = Picture.find(params[:picture_id])
  #   redirect_to picture_path(picture)
  # end

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.likes.create
    render json: {new_like_count: @picture.likes.count}
  end
end
