class LikesController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    @like = @picture.likes.build_with_user(current_user)
    render json: {new_like_count: @picture.likes.count}
  end

end
