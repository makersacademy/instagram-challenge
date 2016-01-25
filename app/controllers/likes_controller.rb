class LikesController < ApplicationController
  include LikesHelper
  before_action :authenticate_user!
  def create
    picture = Picture.find(params[:picture_id])
    like = picture.likes.create_with_user(current_user)
    render json: generate_unlike_json(picture, like)
  end

  def destroy
    like = Like.find(params[:id])
    return if like.user != current_user
    picture = like.picture
    like.destroy
    render json: generate_like_json(picture)
  end

end
