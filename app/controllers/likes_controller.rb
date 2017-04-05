class LikesController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    @like = @picture.likes.create.create_with_user(current_user)
    likes_count = @picture.likes.count
    render json: {new_likes_count: likes_count}
  end

end
