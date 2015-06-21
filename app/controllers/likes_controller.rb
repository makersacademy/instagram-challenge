class LikesController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    @like = @photo.likes.build_with_user(current_user)
    if @like.save
      render json: {new_like_count: @photo.likes.count}
    else
      render 'new'
    end
  end

end