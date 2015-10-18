class CommentsController < ApplicationController

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.build_comment comment_params, current_user
    if @comment.save
      redirect_to photos_path
    else
      if @comment.errors[:user]
        redirect_to photos_path, alert: 'You have to sign in to comment'
      else
        render :new
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

  def edit
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if current_user.id == @comment.user_id
      @comment.update(comment_params)
      flash[:notice] = 'Comment updated'
      redirect_to photos_path
    else
      redirect_to photos_path, alert: 'You can only update your comment'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user.id == @comment.user_id
      @comment.destroy
      flash[:notice] = 'Comment deleted successfully'
      redirect_to photos_path
    else
      redirect_to photos_path, alert: 'You can only delete your comment'
    end
  end

end
