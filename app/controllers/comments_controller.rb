class CommentsController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.create(comment_params)
    redirect_to picture_path(@picture)
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

end
