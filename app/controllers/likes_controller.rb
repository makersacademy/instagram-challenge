class LikesController < ApplicationController


  def create
    @picture = Picture.find(params[:picture_id])
    @like = @picture.likes.create_with_user(current_user)
    likes_count = @image.likes.count
    redirect_to pictures_path
  end

  private



end
