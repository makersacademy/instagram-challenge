class CommentsController < ApplicationController
  def create
    @picture = Picture.find(params[:picture_id])
    params[:comment][:user_id] = current_user.id
    p params
    @comment = @picture.comments.create(comment_params)
    p @comment
    redirect_to picture_path(@picture)
  end

  def destroy
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.find(params[:id])
    @comment.destroy
    redirect_to picture_path(@picture)
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :body)
  end
end
