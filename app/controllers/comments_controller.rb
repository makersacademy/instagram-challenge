class CommentsController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    @params = comment_params
    @params[:user_id] = current_user.id
    @comment = @picture.comments.create(@params)

    if @comment.save
      redirect_to picture_path @picture
    else
      render '/pictures/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
