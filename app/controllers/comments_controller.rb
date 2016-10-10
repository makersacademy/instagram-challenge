class CommentsController < ApplicationController
  before_action :set_post

  def index
    @comments = @photos.comments.order('created_at asc')
  end

def create
  @comment = @photo.comments.build(comment_params)
  @comment.user_id = current_user.id

  if @comment.save
    flash[:success] = "You commented the hell out of that post!"
    redirect_to :back
  else
    flash[:alert] = "Check the comment form, something went horribly wrong."
    render root_path
  end
end

def destroy
  @comment = @photo.comments.find(params[:id])

  @comment.destroy
  flash[:success] = "Comment deleted :("
  redirect_to root_path
end

private

def comment_params
  params.require(:comment).permit(:content)
end

def set_post
  @photo = Photo.find(params[:photo_id])
end
end
