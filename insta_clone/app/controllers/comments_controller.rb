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
      flash[:notice] = 'You must enter a comment'
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
