class LikesController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    @like = Like.new(like_params)
    if @like.save
      redirect_to picture_path(@picture)
    else
      render '/pictures/show'
    end
  end

  private

  def like_params
    params.permit(:user_id, :picture_id)
  end

end
