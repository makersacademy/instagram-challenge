class CommentsController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    picture = Picture.find(params[:picture_id])
    picture.comments.create(comment_params.merge(user_id: current_user.id))
    redirect_to pictures_path
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy_as current_user
      flash[:notice] = 'Comment deleted successfully'
    else
      flash[:alert] = comment.errors
    end
    redirect_to '/'
  end

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

end
