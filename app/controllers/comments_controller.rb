class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @image = Image.find(params[:image_id])
    @comment = Comment.new
  end

  def create
    Comment.save_new_with_current_user(params[:image_id], comment_params, current_user)
    redirect_to('/')
  end

  def destroy
    Comment.delete(params[:id])
    flash[:notice] = 'Comment was deleted'
    redirect_to('/')
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end


end
