class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.likes.create(user: current_user)
    respond_to do |format|
      format.html { redirect_to photo_path(@photo) }
      format.json do
        render json: {
          string: format_likes(@photo.likes.count)
        }
      end
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  private

  def format_likes(num)
    "<b>" + num.to_s + "</b> " + "like".pluralize(num)
  end

end
