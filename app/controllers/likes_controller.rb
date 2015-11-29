class LikesController < ApplicationController

  before_action :authenticate_user!

  def create
    @upload = Upload.find(params[:upload_id])
    @upload.likes.create(user_id: current_user.id)
    redirect_to uploads_path
  end
end
