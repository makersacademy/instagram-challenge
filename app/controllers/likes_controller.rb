class LikesController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @like = Like.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    if current_user.liked_pictures.include?(@picture)
      flash[:notice] = 'You like this picture'
    else
      @picture.likes.create_with_user(current_user)
    end
    render json: {new_like_count: @picture.likes.count}
  end
end
