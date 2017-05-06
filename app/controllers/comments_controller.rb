class CommentsController < ApplicationController
  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.build_comment(comment_params, current_user)

    if @comment.save
      redirect_to '/pictures'
    else
      if @comment.errors[:user]
        redirect_to pictures_path, notice: 'You have already commented on this picture'
      else
        render :new
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:thoughts)
  end
end
