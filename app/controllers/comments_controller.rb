class CommentsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to "/pictures/#{params[:picture_id]}?id=#{params[:picture_id]}"
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
