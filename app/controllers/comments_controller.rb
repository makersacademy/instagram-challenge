class CommentsController < ApplicationController

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.create(comment_params)
    redirect_to '/photos'
  end

  def show
    @photo = Photo.find(params[:id])
    @comments = @photo.comments
    puts @comments  
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
