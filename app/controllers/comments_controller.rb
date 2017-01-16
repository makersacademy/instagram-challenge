class CommentsController < ApplicationController

  def new
    @image = Image.find(params[:image_id])
    @comment = @image.comments.new
  end

  def create
    user = current_user
    @image = Image.find(params[:image_id])
    # @comment = @image.comments.new(comment_params)
    @comment = @image.build_comment comment_params, current_user


    if @comment.save
      redirect_to image_path(params[:image_id])
    else
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find (params[:id])
    @comment.destroy
    redirect_to image_path(@comment.image_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
