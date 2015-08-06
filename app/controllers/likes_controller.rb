class LikesController < ApplicationController

  before_action :authenticate_user!

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.likes.create_with_user(current_user)
    render json: {new_like_count: @picture.likes.count}
  end

end
