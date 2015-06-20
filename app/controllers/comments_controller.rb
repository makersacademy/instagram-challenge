class CommentsController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.add_comments(comment_params, current_user)
    if @comment.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def comment_params
    params.require(:comment).permit(:description)
  end

end
