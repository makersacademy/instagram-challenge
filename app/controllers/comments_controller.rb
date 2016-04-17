class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @image = Image.find(params[:image_id])
    @comment = Comment.new
  end

  def create
    image = Image.find(params[:image_id])
    @comment = image.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to('/')
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:notice] = 'Comment was deleted'
    redirect_to('/')

  end

  def comment_params
    params.require(:comment).permit(:comment)
  end


end
