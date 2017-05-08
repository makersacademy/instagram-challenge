class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    picture = Picture.find(params[:picture_id])
    if current_user.has_liked?(picture)
      flash[:notice] = 'you have already liked this picture'
    elsif current_user == picture.user
      flash[:notice] = "you can't like your own picture"
    else
      like = picture.build_like(current_user)
      like.save
      redirect_to pictures_path
    end
  end

  def index
    @picture = Picture.find(params[:picture_id])
  end

end
