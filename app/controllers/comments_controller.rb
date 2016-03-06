class CommentsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.build_review(comment_params, current_user)
    @comment.save
    redirect_to photos_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    if (@comment.user_id == current_user.id)
      @comment.destroy
      flash[:notice] = 'Comment deleted successfully'
    else
      flash[:notice] = 'This is not your comment to delete'
    end

    redirect_to '/'
  end

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

end
