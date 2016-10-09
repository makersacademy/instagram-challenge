class CommentsController < ApplicationController

  def index
    @comment = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @user = User.find(current_user.id)
    @photo = Photo.find(params[:photo_id])
    add_comment(@user, @photo, comment_params)
    redirect_to "/photos/#{@photo.id}"
  end


  private

  def comment_params
    params[:comment].permit(:comment)
  end

end
