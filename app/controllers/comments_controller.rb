class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    photo = Photo.find(params[:photo_id])
    photo.comments.create(comment_params)
    redirect_to photos_path
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    redirect_to photos_path
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to photos_path
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end
end
