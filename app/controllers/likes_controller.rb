class LikesController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.likes.create
    # @like = @picture.likes.new
    # @like.save
    render json: {new_like_count: @picture.likes.count}
  end
end
