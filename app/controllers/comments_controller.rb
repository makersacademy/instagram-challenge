class CommentsController < ApplicationController
  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.create(comment_params)
    redirect_to photo_path(@photo)
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :user_id)
  end
end
