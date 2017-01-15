class CommentsController < ApplicationController

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.build_with_user(comment_params, current_user)
    @comment.save
    redirect_to '/photos'
  end

  private

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

end
