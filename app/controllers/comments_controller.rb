class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    photo = Photo.find(params[:photo_id])
    comment = photo.comments.create(comment_params)
    redirect_to photos_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
