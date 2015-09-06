class LikesController < ApplicationController
  def create
    @photo = Photo.find(params[:photo_id])
    @photo.likes.create
    render json: {new_like_count: @photo.likes.count}
  end

  # def create
  #   @photo = Photo.find(params[:photo_id])
  #   unless current_user.has_liked?(@photo)
  #     @like = @photo.likes.create(user_id: current_user.id)
  #   end
  #   like_plural = 'like'.pluralize(@photo.likes.count)
  #   render json: {new_like_count: @photo.likes.count, new_pluralisation: like_plural }
  # end
end
