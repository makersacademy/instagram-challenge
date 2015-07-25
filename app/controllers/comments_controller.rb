class CommentsController < ApplicationController

  def new
    @photos = Photo.find(params[:photo_id])
    @comments = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.comments.create(comment_params)
  end

  def comment_params
    params.require(:comment).permit(:thoughts)
  end
