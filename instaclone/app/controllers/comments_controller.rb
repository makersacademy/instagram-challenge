class CommentsController < ApplicationController

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end


  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to "/photos/#{@photo.id}"
    else
      if @comment.errors[:user]
        redirect_to '/photos', alert: 'You have already commented on this photo'
      else
        render :new
      # some error handling goes here!
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

end
