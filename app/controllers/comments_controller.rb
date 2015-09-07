class CommentsController < ApplicationController
  def create
    @photo = Photo.find(params[:photo_id])
    @photo.comments.build_with_user(comment_params, current_user).save
    redirect_to photo_path(@photo)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy_as_user(current_user)
    flash[:notice] = 'Comment deleted successfully'
    redirect_to(:back)
  end

  def comment_params
    params.require(:comment).permit(:contents)
  end
end
