class LikesController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    if !current_user.has_liked? @photo
      @like = @photo.create_like current_user
      @like.save
      render json: {new_like_count: @photo.likes.count}
    # elsif @like.errors[:user]
    else
      flash[:notice] = 'You have liked this already'
      redirect_to photos_path
      # redirect_to photos_path, alert: 'You have liked this already'
    end
  end

end
