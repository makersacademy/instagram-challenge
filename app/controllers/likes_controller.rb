class LikesController < ApplicationController
  def index
    redirect_to pictures_path
  end

  def create
    @picture = Picture.find(params[:picture_id])
    if user_signed_in?
      @like = @picture.likes.build
      @like.user = current_user
      if @like.save
        render json: { like_text: render_to_string('pictures/_likes', locals: { picture: @picture }, layout: nil) }
      else
        redirect_to pictures_path
      end
    else
      redirect_to pictures_path
    end
  end
end
