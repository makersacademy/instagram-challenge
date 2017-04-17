class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to pictures_path
  end

  def comment_params
    params.require(:comment).permit(:message)
  end
end
