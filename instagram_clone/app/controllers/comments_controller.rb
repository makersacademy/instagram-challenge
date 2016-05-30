class CommentsController < ApplicationController

  def index
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.comments.create(comment_params)
    redirect_to "/photos/#{@photo.id}/comments/new"
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
