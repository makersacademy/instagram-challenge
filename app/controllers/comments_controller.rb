class CommentsController < ApplicationController

  def new
    create
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.create_comment(comment_params, current_user)
    redirect_to "/photos/#{@photo.id}"
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
