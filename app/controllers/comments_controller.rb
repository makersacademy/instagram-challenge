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
      flash[:notice] = 'Invalid'
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
      flash[:notice] = 'Picture deleted'
      redirect_to '/'
    else
      flash[:notice] = 'You may not delete this'
      redirect_to '/'
    end
  end

  def comment_params
    params.require(:comment).permit(:description)
  end

end
