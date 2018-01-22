class CommentsController < ApplicationController
  def create
    puts params
    puts params.class

    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.create(comment_params)
    redirect_to pictures_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
