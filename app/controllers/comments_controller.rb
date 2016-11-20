class CommentsController < ApplicationController
  
  before_action :authenticate_user!

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to photo_path(@photo)
  end

  private

  def comment_params
    params.require(:comment).permit(:comments)
  end

end
