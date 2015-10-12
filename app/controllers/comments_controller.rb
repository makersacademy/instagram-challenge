class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.comments.create_with_user(comment_params, current_user)
    redirect_to photos_path
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
