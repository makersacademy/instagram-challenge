class LikesController < ApplicationController

  before_action :authenticate_user!

  def create
    picture = picture.find(params[:picture_id])

    if like = Like.find_by(post_id: post.id, user_id: current_user.id)
      like.destroy
    else
      like = Like.new(user_id: current_user.id, post_id: post.id)
      like.save
    end

    redirect_to root_path
  end

  private

  def post_params
    params.require(:like).permit(:picture_id)
  end
end
