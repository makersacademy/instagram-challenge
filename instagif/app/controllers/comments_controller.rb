class CommentsController < ApplicationController

  def create
    @gif = Gif.find(params[:gif_id])
    @comment = @gif.comments.create(comment: comment_params[:comment] )

    respond_to do |format|
      format.html { redirect_to @gif }
    end
  end

  def comment_params
    params.require(:comment).permit(:gif_id, :comment)
  end
end
