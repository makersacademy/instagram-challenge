class LikesController < ApplicationController

  # def new
  #   @picture = Picture.find(params[:picture_id])
  #   @comment = Like.new
  # end

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.likes.create
    render json: {new_like_count: @picture.likes.count}
  end

end
