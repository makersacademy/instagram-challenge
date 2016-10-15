class LikeController < ApplicationController

  # GET /likes/new
  def new
    @like = Like.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    puts @photo
    puts @photo.comments
    puts @photo.likes
    
    like = @photo.likes.new

    like.user = current_user
    like.save
    redirect_to "/photo/#{@photo.id}"
  end


  def destroy
    @photo = Photo.find(params[:photo_id])
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to "/photo/#{@photo.id}"
  end

end
