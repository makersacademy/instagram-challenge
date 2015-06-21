class LikesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.likes.create(:user_id =>current_user)
    redirect_to pictures_path
  end

end
