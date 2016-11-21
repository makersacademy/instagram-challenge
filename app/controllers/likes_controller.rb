class LikesController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    @like = @picture.likes.build_with_user({}, current_user)

    if @like.save
      render json: { new_likes_count: @picture.likes.count }
    else
      render json: { already_liked_message: 'Sorry, you have already liked this picture' }
    end
  end

end
