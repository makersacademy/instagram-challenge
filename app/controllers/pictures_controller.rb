class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    flash[:notice]
    if user_signed_in?
     @picture = Picture.new
     @user = current_user
    else
     redirect_to new_user_session_path
    end
  end

  def create
    @user = current_user
    @picture = @user.pictures.create(picture_params)
    @picture.save
    redirect_to pictures_path
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def update
    puts params[:id]
    @picture = Picture.find(params[:id])
    puts @picture
    update_likes = @picture.likes.to_i + 1
    puts update_likes
    @picture.update(likes: update_likes)
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :image)
  end


end
