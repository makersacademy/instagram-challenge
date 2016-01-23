class CommentsController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.create_with_user(comment_params, current_user)
    redirect_to pictures_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user.comments.include? @comment
      @comment.destroy
      redirect_to pictures_path
    else
      flash[:notice] = 'Sorry, you can only delete your own comments'
      redirect_to pictures_path
    end
  end

  def comment_params
    params.require(:comment).permit(:words)
  end


end
