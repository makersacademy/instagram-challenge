class LikesController < ApplicationController
  def create
    @picture = Picture.find(params[:picture_id])
    @picture.likes.create
    render json: {new_like_count: @picture.likes.count}
  end

  def show

  end

  def destroy
    @picture = Picture.find(params[:picture_id])
    @picture.likes.last.destroy
    render json: {new_like_count: @picture.likes.count}
  end
end
