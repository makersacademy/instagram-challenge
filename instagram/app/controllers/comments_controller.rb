class CommentsController < ApplicationController
  before_action :set_photo

  def create
    @comment = @photo.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.photo_id = @photo
    redirect_to photos_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_photo
    @photo = Photo.find(params[:photo_id])
  end

end
