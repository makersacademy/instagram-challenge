class LikesController < ApplicationController


  def create
    @picture = Picture.find(params[:picture_id])
    if user_signed_in?
    @picture.likes.create
    render json: {new_like_count: @picture.likes.count}
  end
  end
end
