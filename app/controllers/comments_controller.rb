class CommentsController < ApplicationController

  def new
    create
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.comments.create(comment_parms)
    redirect_to "/photos/#{@photo.id}"
  end

  private

  def comment_parms
    params.require(:comment).permit(:content)
  end
end
