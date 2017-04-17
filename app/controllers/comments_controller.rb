class CommentsController < ApplicationController

before_action :authenticate_user!
  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.comments.create(comment_params)
    redirect_to picture_path(@picture)
  end

  def destroy
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.find(params[:id])
    
    if destroy_as(@comment.user_id)
      @comment.destroy
      flash[:notice] = "Comment successfully deleted"
    else
      flash[:notice] = "Comment not deleted"
    end

    redirect_to picture_path(@picture)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def destroy_as(id)
    current_user.id == id
  end
end
