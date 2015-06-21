class CommentsController < ApplicationController

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.comments.create(comment_params)
    redirect_to photos_path
  end

end
