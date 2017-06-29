class CommentsController < ApplicationController

  def new
    @user = current_user
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end


  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.create(comment_params)
    if @comment.save
      redirect_to '/pictures'
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id)
  end

end
