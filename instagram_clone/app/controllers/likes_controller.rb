class LikesController < ApplicationController
  def create
    picture = Picture.find(params[:picture_id])
    like = picture.likes.where(:user => current_user).first_or_initialize
    like.save!

    render :json => {
      :like => like,
      :like_count => picture.likes.count,
    }
  end

end
