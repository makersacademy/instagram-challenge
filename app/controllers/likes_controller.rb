class LikesController < ApplicationController
  def create
    @picture = Picture.find(params[:picture_id])
    @picture.likes.create
    # redirect_to pictures_path
    render json: {new_like_count: @picture.likes.count}
  end
end
