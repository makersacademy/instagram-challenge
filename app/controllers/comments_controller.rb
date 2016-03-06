class CommentsController < ApplicationController
  def new
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.new(comment_params)
    @comment.user_id=current_user.id  
    @comment.commenter = current_user.email
    if @comment.save
      flash[:success] = "the comment was added!"
      redirect_to '/'
    end 
  end

  def show
  end

  def edit
    @comment = Comment.find(params[:id])
end

def update
  @comment = Comment.find(params[:id])
  @comment = @comment.update(comment_params)
  redirect_to '/'
end 

def destroy
@comment = Comment.find(params[:id])
if @comment.destroy
flash[:success] = "the photo was deleted!"
redirect_to '/'
end
end

def comment_params
  params.require(:comment).permit(:body)
end

end
