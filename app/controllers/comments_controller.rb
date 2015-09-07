class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @photo = Photo.find(params[:photo_id])
    comment = Comment.create(photo_params.merge(photo: @photo, user: current_user))
    if !(comment.valid?)
      flash[:notice] = "You must include a comment when posting"
    end
    redirect_to photo_path(@photo)
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to photo_path(@photo)
  end

  def photo_params
    params.require(:comment).permit(:comment)
  end
end
