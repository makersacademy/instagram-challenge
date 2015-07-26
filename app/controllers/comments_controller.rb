class CommentsController < ApplicationController
  
  before_action :authenticate_user!
  
  def new
    if current_user
      @photo = Photo.find(params[:photo_id])
      @comment = Comment.new
    end
  end
  
  def create
    @user = current_user.username
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.build_with_user comment_params, current_user
    if @comment.save
      redirect_to root_path
    else 
      render 'new'
    end
  end

  def comment_params
    params.require(:comment).permit(:thoughts)
  end
end
