class LikesController < ApplicationController

  def create
    unless liked_by_user
      Like.create(user_id: current_user.id, post_id: params[:format])
    end
    redirect_to posts_url
  end

  private

  def liked_by_user
    Like.where(user_id: current_user.id, post_id: params[:format]).exists?
  end

end
