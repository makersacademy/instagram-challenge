class LikesController < ApplicationController

  before_action :authenticate_user!

  def new
    @picture = Picture.find(params[:picture_id])
    @like = @picture.likes.create
    if @like.save
      redirect_to pictures_path
    else
      redirect_to pictures_path, alert: 'You have already liked this picture'
    end
  end
end
