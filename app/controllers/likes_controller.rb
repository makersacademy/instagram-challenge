class LikesController < ApplicationController
  before_action :authenticate_user!, only: :create
  def index
    redirect_to pictures_path
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @like = @picture.build_with_user2(current_user)
    if @like.save
      render json: { like_text: render_to_string('pictures/_likes', locals: { picture: @picture }, layout: nil) }
    else
      redirect_to pictures_path
    end
  end
end
