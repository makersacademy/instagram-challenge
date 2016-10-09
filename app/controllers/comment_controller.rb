class CommentController < ApplicationController
  def new
    user_signed_in? ? (@comment = Comment.new) : (redirect_to "index")
  end

  def create
    @user = User.find(current_user.id)
    @photo = Photo.find(params[:photo_id])
    comment = Comment.add_comment(@user, @photo, comment_params)
    redirect_to "/photo/#{@photo.id}"
  end

  def edit
    @comment = Comment.find(:id)
  end

  def update
    @comment = Comment.find(:id)
    @comment.update(comment_params)
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to "/photo/#{@photo.id}"
  end

  private

  def comment_params
    params[:comment].permit(:description)
  end
end
