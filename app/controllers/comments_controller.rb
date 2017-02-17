class CommentsController < ApplicationController

  before_action :authenticate_user!


  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.build_with_user(comment_params, current_user)
    if @comment.save
      redirect_to photos_path
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:thoughts)
  end
end
