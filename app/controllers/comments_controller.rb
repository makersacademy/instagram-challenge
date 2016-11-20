class CommentsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]
  before_action :find_commentable

  def new
    if (params[:photo_id])
      @photo = Photo.find(params[:photo_id])
      @comment = @commentable.comments.new
    else
      @comment = @commentable.comments.new
    end
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to '/photos'
  end

  def show
    @user = current_user
    @photo = Photo.find(params[:id])
    @comments = @photo.comments
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to '/photos'
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    @commentable = Comment.find(params[:comment_id]) if params[:comment_id]
    @commentable = Photo.find(params[:photo_id]) if params[:photo_id]
  end

end
