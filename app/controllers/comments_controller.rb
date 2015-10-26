class CommentsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to '/pictures'
  end

  def destroy
    @picture= Picture.find(params[:id])
    @comment = @picture.comment.find(comment_params)
    @comment.destroy
    flash[:notice] = 'Commented deleted successfully'
    redirect_to '/pictures'
  end


  def comment_params
    params.require(:comment).permit(:comment)
  end
end
