class LikesController < ApplicationController

  def new
    @photo = Photo.find(params[:id])
    @like = Like.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    like = @photo.likes.create(:photo_id => @photo.id, :user_id => current_user.id)
    p like
    redirect_to "/photos"
  end

  def destroy
    @like.destroy
  end

  private

  def like_params
    params.require(:like).permit(:photo_id)
  end

end
