class CommentsController < ApplicationController
  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.create(params[:comment].permit(:commenter, :body))
    redirect_to picture_path(@picture)
  end
end
