class CommentsController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to picture_path(@picture)
  end

  def edit
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.find(params[:id])

    if current_user == @comment.user
      @comment.update(comment_params)
      flash[:notice] = 'You have successfully updated the comment.'
    else
      flash[:notice] = "Cannot edit someone else's comment"
    end
    redirect_to picture_path(@picture)
  end

  def destroy
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.find(params[:id])

    if @comment.user == current_user
      @comment.destroy
      flash[:notice] = 'You have successfully deleted the comment.'
    else
      flash[:notice] = "Cannot delete someone else's comment"
    end
    redirect_to picture_path(@picture)
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
