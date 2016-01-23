class LikesController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    @like = @picture.likes.build_with_user({}, current_user)

    if @like.save
      redirect_to pictures_path
    else
      flash[:alert] = 'Sorry, you have already liked this picture'
      redirect_to pictures_path
    end
  end

end
