class LikesController < ApplicationController

  def create
    user = current_user
    picture = Picture.find(params[:picture_id])
    like = picture.likes.build
    like.user = current_user
    if like.save
      redirect_to root_path
    else
      redirect_to root_path
      flash[:notice] = 'You can give a maxium of 1 Like to a picture.'
    end
  end

end
