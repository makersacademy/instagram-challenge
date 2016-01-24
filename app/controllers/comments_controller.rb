class CommentsController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.build_comment(comment_params, current_user)
    if @comment.save
      redirect_to picture_path(@picture)
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end
end
