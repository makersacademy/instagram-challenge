class CommentsController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.create({ body: comment_params[:body], user_id: current_user.id })
    redirect_to root_url
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
