class CommentsController < ApplicationController

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

  def comment_params
    params.require(:comment).permit(:my_comment)
  end
end
