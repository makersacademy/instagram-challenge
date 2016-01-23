class LikesController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    @like = @picture.likes.build_with_user({}, current_user)

    if @like.save
      render json: { new_likes_count: @picture.likes.count }
    else
      flash[:alert] = 'Sorry, you have already liked this picture'
      redirect_to pictures_path
    end
  end

end
