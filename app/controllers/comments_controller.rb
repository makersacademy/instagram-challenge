class CommentsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.create(comment_params)
    if @comment.save
      redirect_to photos_path
    else
      flash[:alert] = 'Please enter a comment'
      redirect_to new_photo_comment_path
    end
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.find(params[:id])
    if (@comment.user_id == current_user.id)
      @comment.destroy
    else 
      flash[:notice] = 'You cannot delete other users\' comments'
    end
    redirect_to photos_path
  end

  def comment_params
  	params[:comment][:user_id] = current_user.id
    params.require(:comment).permit(:message, :user_id)
  end
end
