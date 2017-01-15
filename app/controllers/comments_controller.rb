class CommentsController < ApplicationController
  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.comments.create(comment_params)
  end

  private
  def comment_params
    params.require(:comment).permit(:remarks)
  end
end
