class CommentsController < ApplicationController
  def create
    @picture = Picture.find(params[:picture_id])
    full_params = comment_params
    full_params[:user_id] = current_user.id
    @comment = @picture.comments.create(full_params)

    if @comment.save
      redirect_to picture_path @picture
    else
      render '/pictures/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @picture = Picture.find(params[:picture_id])
    redirect_to picture_path @picture
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
