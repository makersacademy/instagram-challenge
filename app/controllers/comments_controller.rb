class CommentsController < ApplicationController

  before_action :require_permission

  def new
    create
  end

  def create
    photo = Photo.find(params[:photo_id])
    comment = photo.create_comment(comment_params, current_user)
    if comment == false
      flash.keep[:notice] = 'Comment field must not be empty'
    end
    redirect_to "/photos/#{photo.id}"
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def require_permission
    unless current_user
      redirect_to '/users/sign_in'
    end
  end
end
