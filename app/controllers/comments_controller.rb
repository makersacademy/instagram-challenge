class CommentsController < ApplicationController
  def new
    puts Photo.find(params[:photo_id]).nil?
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.new(comment_params)
    if @comment.save
      flash[:success] = "the photo was added!"
      redirect_to '/'
    end 
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

   def comment_params
    params.require(:comment).permit(:body)
  end

end
