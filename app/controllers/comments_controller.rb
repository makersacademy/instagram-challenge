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
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to photo_path(@photo)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :photo_id, :id)
  end

end
