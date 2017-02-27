class LikesController < ApplicationController
  def create
    @picture = Review.find(params[:picture_id])
    like = @picture.likes.new
    like.user = current_user
    like.save
    render json: {new_like_count: @picture.likes.count}
  end
end
