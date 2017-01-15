class CommentsController < ApplicationController
  def create
    @picture = Picture.find(params[:picture_id])
    @picture.comments.create(comment_params)
    redirect_to "/pictures/#{params[:picture_id]}?id=#{params[:picture_id]}"
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
