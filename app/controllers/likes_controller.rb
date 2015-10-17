class LikesController < ApplicationController
  def create
    @picture = Picture.find(params[:picture_id])
    if user_signed_in?
      @like = @picture.likes.build
      @like.user = current_user
      if @like.save
        redirect_to pictures_path
      else
        redirect_to pictures_path
      end
    else
      redirect_to pictures_path
    end
  end
end
