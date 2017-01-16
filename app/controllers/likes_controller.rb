class LikesController < ApplicationController

  before_action :authenticate_user!, :find_photo

  def new
    @like = Like.new
    create
  end

  def create
    like = @photo.likes.create_with_user({}, current_user)
    redirect_to photo_path(@photo)
  end

  def destroy
    like = @photo.likes.detect { |like| like.user == current_user }
    like.destroy
    redirect_to photo_path(@photo)
  end

  private

  def find_photo
    @photo = Photo.find(params[:photo_id])
  end

end
