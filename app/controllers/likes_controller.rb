class LikesController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    @like = @picture.likes.create_with_user({}, current_user)
    if @like.save
      flash[:notice] = 'You have liked'
    else
      flash[:notice] = 'You have already Liked this picture'
    end
    redirect_to pictures_path
  end

end
