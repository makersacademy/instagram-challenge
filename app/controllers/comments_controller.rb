class CommentsController < ApplicationController
  before_action :require_login

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.create(user_id: current_user.id, text: comment_params[:text])
    redirect_to photo_path(@photo)
  end

  private
    def comment_params
      params.require(:comment).permit(:text)
    end
end
