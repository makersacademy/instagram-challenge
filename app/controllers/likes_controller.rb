class LikesController < ApplicationController
  before_action :find_photo
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:alert] = "You can only like each photo once"
    else
      @photo.likes.create(user_id: current_user.id)
      redirect_to photo_path(@photo)
    end
  end

  def destroy
    if !(already_liked?)
      flash[:alert] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to photo_path(@photo)
  end

  private

  def find_like
    @like = @photo.likes.find(params[:id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, photo_id: params[:photo_id]).exists?
  end

  def find_photo
    @photo = Photo.find(params[:photo_id])
  end

end
