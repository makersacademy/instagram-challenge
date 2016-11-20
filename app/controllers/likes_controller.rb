class LikesController < ApplicationController
  def create
    @picture = Picture.find(params[:picture_id])
    @like = Like.new
    @like.user_id = current_user.id
    @like.picture_id = @picture.id
    @like.save
    redirect_to pictures_path
  end
end
