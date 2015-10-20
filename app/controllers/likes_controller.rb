class LikesController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    if !current_user.has_liked? @photo
      @like = @photo.create_like current_user
      @like.save
      render json: {new_like_count: @photo.likes.count}
    else
      flash[:notice] = 'You have liked this already'
      redirect_to photos_path
    end
  end

end
