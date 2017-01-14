class CommentsController < ApplicationController

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    p params
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new(comment_params)
    @comment.photo = @photo
    @comment.user = current_user
    if @comment.save
      redirect_to photo_path(@photo)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :photo_id)
  end
end
