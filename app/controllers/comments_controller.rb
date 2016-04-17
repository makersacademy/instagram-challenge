class CommentsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def new
    current_picture
    new_comment
  end

  def create
    comment_on_current_picture
    redirect_to current_picture_path
  end

  private

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

  def current_picture
    @picture = Picture.find(params[:picture_id])
  end

  def new_comment
    @comment = Comment.new
  end

  def comment_on_current_picture
    current_picture.comments.create(comment_params)
  end

  def current_picture_path
    picture_path(params[:picture_id])
  end
end
