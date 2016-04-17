class CommentsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def new
    current_picture
    new_comment
  end

  def create
    comment_on_current_picture
  end

  def edit
    check_editing_permission
  end

  def update
    update_current_comment
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
    @comment = current_picture.comments.create(comment_params)
    @comment.associate_with(current_user)
    redirect_to current_picture_path
  end

  def current_picture_path
    picture_path(params[:picture_id])
  end

  def current_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

  def update_current_comment
    current_comment.update(comment_params)
    redirect_to picture_path(current_comment.picture_id)
  end

  def check_editing_permission
    unless current_user.is_owner_of?(current_comment)
      flash[:notice] = 'You cannot edit this comment'
      redirect_to picture_path(current_comment.picture_id)
    end
    current_comment
  end
end
