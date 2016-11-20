class LikeController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @like = Like.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @like = @picture.likes.new
    @like.user_id = current_user.id
    if @like.save
      render '/'
    else
      render '/'
    end
  end


end
