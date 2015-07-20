class LikesController < ApplicationController
  def create
    @picture = Picture.find(params[:picture_id])
    @picture.likes.create
    render json: {new_like_count: @picture.likes.count}
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.likes.last
    @like = @picture.likes.last
    @like.destroy
    render json: {new_like_count: @picture.likes.count}
  end
end