class LikesController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    params[:user_id] = current_user.id
    p params
    # params[:like][:picture_id] = params[:picture_id]
    @like = @picture.likes.create(like_params)
    # redirect_to picture_path(@picture)
    redirect_back(fallback_location:"/")
  end

  def destroy
    @picture = Picture.find(params[:picture_id])
    @like = @picture.likes.find(params[:id])
    @like.destroy
    # redirect_to picture_path(@picture)
    redirect_back(fallback_location:"/")
  end

  private

  def like_params
    params.permit(:user_id, :picture_id)
  end

end
