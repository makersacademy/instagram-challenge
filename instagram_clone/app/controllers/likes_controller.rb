class LikesController < ApplicationController
  def create
    picture = Picture.find(params[:picture_id])
    like = picture.likes.where(:user => current_user).first_or_initialize
    like.save!

    redirect_to '/'

    # render :json => {
    #   :like => like,
    #   :like_count => picture.likes.count,
    # }
    # Not using but with the like.js file works
  end

end
