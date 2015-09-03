class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.build_with_user(comment_params, current_user)
    if @comment.save
      redirect_to '/pictures'
    else
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy_as current_user
      flash[:notice] = 'Comment deleted successfully'
    else
      flash[:notice] = 'You can only delete comments which you wrote'
    end
    redirect_to '/pictures'
  end

  def comment_params
    params.require(:comment).permit(:my_comment)
  end
end
