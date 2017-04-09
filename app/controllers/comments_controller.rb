class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    comment = @photo.comments.new(comment_params)
    comment.user_id = current_user.id
    comment.save
    redirect_to "/photos"
  end

  def destroy
    @comment.destroy
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :photo_id)
    end
end
