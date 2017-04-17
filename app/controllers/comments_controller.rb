class CommentsController < ApplicationController

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @photo = Photo.find params[:photo_id]
    @photo.comments.create(comment_params.merge(user_id: current_user.id))
    redirect_to photos_path
  end

  def comment_params
    params.require(:comment).permit(:comments)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment deleted successfully'
    redirect_to '/'
  end

end
