class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.build_comment(comment_params, current_user)
    if @comment.save
      redirect_to pictures_path
    else
      redirect_to new_picture_comment_path
      flash[:notice] = 'An error has occurred.'
    end
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
