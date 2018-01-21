class CommentsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.create(comment_params)
    @photo.save
    redirect_to photo_path(@photo)
  end


  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
