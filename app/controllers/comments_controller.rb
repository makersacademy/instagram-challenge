class CommentsController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.comments.create(comment_params)
    redirect_to picture_path(@picture)
  end

  def edit
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    flash[:notice] = 'You have successfully updated the comment.'
    redirect_to picture_path(@picture)
  end

  def destroy
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'You have successfully deleted the comment.'
    redirect_to picture_path(@picture)
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
