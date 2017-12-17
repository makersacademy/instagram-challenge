class CommentsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    photo.comments.create(body: params[:comment][:body])
    200
  end

  private

  def photo
    photo = Photo.find_by(id: params[:photo_id])
  end

end
