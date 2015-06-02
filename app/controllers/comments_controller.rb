class CommentsController < ApplicationController

  def new
    @photo = Photo.find params[:photo_id]
  end

  def create
    @photo = Photo.find params[:photo_id]
    @comment = @photo.comments.new(text: params[:comment],
                                   user: current_user)
    if @comment.save
      redirect_to '/'
    end
  end

end
