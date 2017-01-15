class CommentsController < ApplicationController

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    user = current_user
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.build_comment comment_params, current_user
    if @comment.save
      redirect_to "/photos/#{@photo.id}"
    else
      flash[:notice] = "Error: Comment was not saved"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def build_comment(attributes = {}, user)
    comment = comments.build(attributes)
    comment.user = user
    comment
  end

end
