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
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user.id == @comment.user_id
      @comment.destroy
    else
      flash[:notice] = 'You did not write this comment'
    end
    redirect_to photos_path
  end

  def comment_params
    params.require(:comment).permit(:thoughts)
  end
end



  