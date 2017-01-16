class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new(comment_params)
    @comment.photo = @photo
    @comment.user = current_user
    if @comment.save
      redirect_to photo_path(@photo)
    end
  end

  def destroy
    p params
    @photo = Photo.find(params[:photo_id])
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    redirect_to photo_path(@photo)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :id, :photo_id)
  end

end
