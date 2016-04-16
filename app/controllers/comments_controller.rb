class CommentsController < ApplicationController
  def create
    photo = Photo.find(params[:photo_id])
    photo.comments.create(comments_params)
    redirect_to photos_path
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to photos_path
  end

  def comments_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end
end
